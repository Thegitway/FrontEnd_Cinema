import 'package:cinema/model/Cinema.dart';
import 'package:cinema/model/ProjectionFilm.dart';
import 'package:google_maps/google_maps.dart';

enum CinemaCurrentState {
  initial,
  loading,
  Cinemaloaded,
  Projectionloaded,
  error
}

class CinemaState<T> {
  List<Cinema> cinemas;
  final dynamic error;
  final CinemaCurrentState currentState;
  final List<ProjectionFilm> pros;

  CinemaState({this.cinemas, this.pros, this.error, this.currentState});

  factory CinemaState.initial() =>
      CinemaState(currentState: CinemaCurrentState.initial);

  factory CinemaState.loading() =>
      CinemaState(currentState: CinemaCurrentState.loading);

  factory CinemaState.Cinemaloaded(List<Cinema> cinemas) => CinemaState(
      cinemas: cinemas, currentState: CinemaCurrentState.Cinemaloaded);

  factory CinemaState.ProjectionLoaded(List<ProjectionFilm> pros) =>
      CinemaState(
          pros: pros, currentState: CinemaCurrentState.Projectionloaded);

  factory CinemaState.error(dynamic error) =>
      CinemaState(currentState: CinemaCurrentState.error, error: error);
}
