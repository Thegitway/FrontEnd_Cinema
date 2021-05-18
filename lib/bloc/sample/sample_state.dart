enum SampleCurrentState { initial, loading, loaded, error }

class CinemaState<T> {
  final dynamic error;
  final SampleCurrentState currentState;

  const CinemaState({this.error, this.currentState});

  factory CinemaState.initial() =>
      const CinemaState(currentState: SampleCurrentState.initial);

  factory CinemaState.loading() =>
      const CinemaState(currentState: SampleCurrentState.loading);

  factory CinemaState.loaded() =>
      const CinemaState(currentState: SampleCurrentState.loaded);

  factory CinemaState.error(dynamic error) =>
      CinemaState(currentState: SampleCurrentState.error, error: error);
}
