import 'package:cinema/api/DioServie.dart';
import 'package:cinema/model/Cinema.dart';
import 'package:cinema/model/ProjectionFilm.dart';
import 'package:cinema/model/Salle.dart';
import 'package:cinema/model/Seance.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cinema/bloc/cinema/cinema.dart';

class CinemaBloc<T> extends Bloc<CinemaEvent, CinemaState> {
  final DioService _dioService;

  CinemaBloc(this._dioService) : super(CinemaState.initial());

  @override
  CinemaState get initialState => CinemaState.initial();

  @override
  Stream<CinemaState> mapEventToState(CinemaEvent event) async* {
    if (event is CinemaVilleLoadingEvent) {
      yield CinemaState.loading();
      try {
        List<Cinema> cinemas;
        if (event.first == true)
          cinemas = await _dioService
              .getCinemaVille(await _dioService.getFirstVille());
        else
          cinemas = await _dioService.getCinemaVille(event.ville);

        yield CinemaState.Cinemaloaded(cinemas);
      } catch (e) {
        yield CinemaState.error(e.toString());
      }
    } else if (event is CinemaClickEvent) {
      try {
        yield CinemaState.loading();
        List<ProjectionFilm> pros = [];
        List<Salle> salle = await _dioService.getSalleCinema(event.cinema.id);
        List<Seance> seance = await _dioService.getSeanceSalle(salle.first.id);
        pros = await _dioService.getProSeance(seance.first.id);

        yield CinemaState.ProjectionLoaded(pros);
      } catch (e) {
        yield CinemaState.error(e.toString());
      }
    }
  }
}
