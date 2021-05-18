enum CinemaCurrentState { initial, loading, loaded, error }

class CinemaState<T> {
  final dynamic error;
  final CinemaCurrentState currentState;

  const CinemaState({this.error, this.currentState});

  factory CinemaState.initial() =>
      const CinemaState(currentState: CinemaCurrentState.initial);

  factory CinemaState.loading() =>
      const CinemaState(currentState: CinemaCurrentState.loading);

  factory CinemaState.loaded() =>
      const CinemaState(currentState: CinemaCurrentState.loaded);

  factory CinemaState.error(dynamic error) =>
      CinemaState(currentState: CinemaCurrentState.error, error: error);
}
