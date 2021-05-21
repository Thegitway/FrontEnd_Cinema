import 'package:cinema/model/Cinema.dart';

enum CinemaCurrentState { initial, loading, Cinemaloaded, error }

class CinemaState<T> {
  List<Cinema> cinemas;
  final dynamic error;
  final CinemaCurrentState currentState;

  CinemaState({this.cinemas, this.error, this.currentState});

  factory CinemaState.initial() =>
      CinemaState(currentState: CinemaCurrentState.initial);

  factory CinemaState.loading() =>
      CinemaState(currentState: CinemaCurrentState.loading);

  factory CinemaState.Cinemaloaded(List<Cinema> cinemas) => CinemaState(
      cinemas: cinemas, currentState: CinemaCurrentState.Cinemaloaded);

  factory CinemaState.error(dynamic error) =>
      CinemaState(currentState: CinemaCurrentState.error, error: error);
}
