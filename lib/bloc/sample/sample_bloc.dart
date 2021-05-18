import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cinema/bloc/sample/sample.dart';

class SampleBloc<T> extends Bloc<SampleEvent, CinemaState> {
  SampleBloc() : super(null);

  @override
  CinemaState get initialState => CinemaState.initial();

  @override
  Stream<CinemaState> mapEventToState(SampleEvent event) async* {
    if (event is SampleSubEvent) {
      yield CinemaState.loading();
      /* TODO */
      yield CinemaState.loaded();
    }
  }
}
