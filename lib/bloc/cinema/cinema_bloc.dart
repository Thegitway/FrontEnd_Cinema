import 'package:cinema/api/DioServie.dart';
import 'package:cinema/model/Cinema.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cinema/bloc/cinema/cinema.dart';

class CinemaBloc<T> extends Bloc<CinemaEvent, CinemaState> {
  final DioService _dioService;

  CinemaBloc(this._dioService) : super(null);

  @override
  CinemaState get initialState => CinemaState.initial();

  @override
  Stream<CinemaState> mapEventToState(CinemaEvent event) async* {
    if (event is CinemaLoadingEvent) {
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
    }
  }
}
