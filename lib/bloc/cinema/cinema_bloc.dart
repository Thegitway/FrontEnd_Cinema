import 'package:cinema/api/DioServie.dart';
import 'package:cinema/model/Cinema.dart';
import 'package:cinema/model/ProjectionFilm.dart';
import 'package:cinema/model/Salle.dart';
import 'package:cinema/model/Seance.dart';
import 'package:cinema/model/Ville.dart';
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
        List<Ville> villes = [];
        villes = await _dioService.getAllVille();
        if (event.first == true)
          cinemas = await _dioService.getCinemaVille(villes.first);
        else
          cinemas = await _dioService.getCinemaVille(event.ville);

        yield CinemaState.Cinemaloaded(cinemas: cinemas, villes: villes);
      } catch (e) {
        yield CinemaState.error(e.toString());
      }
    } else if (event is CinemaClickEvent) {
      try {
        yield CinemaState.loading();
        List<ProjectionFilm> pros = [];

        List<Salle> salle = await _dioService.getSalleCinema(event.cinema.id);
        print("omar " + salle.toString());

        List<Seance> seance =
            await _dioService.getSeanceSalle(salle?.first?.id);
        print("omar " + seance.toString());

        pros = await _dioService.getProSeance(seance?.first?.id);
        print("omar " + pros.toString());
        yield CinemaState.ProjectionLoaded(pros);
      } catch (e) {
        yield CinemaState.error(e.toString());
      }
    }
  }
}
