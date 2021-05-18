import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cinema/bloc/cinema_registration/cinema.dart';

class CinemaBloc<T> extends Bloc<CinemaEvent, CinemaState> {
  CinemaBloc() : super(null);

  @override
  CinemaState get initialState => CinemaState.initial();

  @override
  Stream<CinemaState> mapEventToState(CinemaEvent event) async* {
    if (event is CinemaSubEvent) {
      yield CinemaState.loading();
      /* TODO */
      yield CinemaState.loaded();
    }
  }
}
