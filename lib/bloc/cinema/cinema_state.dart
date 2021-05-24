import 'package:cinema/model/Cinema.dart';
import 'package:cinema/model/ProjectionFilm.dart';
import 'package:cinema/model/Ville.dart';

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
  final List<Ville> villes;

  CinemaState(
      {this.cinemas, this.villes, this.pros, this.error, this.currentState});

  factory CinemaState.initial() =>
      CinemaState(currentState: CinemaCurrentState.initial);

  factory CinemaState.loading() =>
      CinemaState(currentState: CinemaCurrentState.loading);

  factory CinemaState.Cinemaloaded(
          {List<Cinema> cinemas, List<Ville> villes}) =>
      CinemaState(
          cinemas: cinemas,
          villes: villes,
          currentState: CinemaCurrentState.Cinemaloaded);

  factory CinemaState.ProjectionLoaded(List<ProjectionFilm> pros) =>
      CinemaState(
          pros: pros, currentState: CinemaCurrentState.Projectionloaded);

  factory CinemaState.error(dynamic error) =>
      CinemaState(currentState: CinemaCurrentState.error, error: error);
}
