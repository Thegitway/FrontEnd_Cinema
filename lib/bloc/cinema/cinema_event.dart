import 'package:cinema/model/Cinema.dart';
import 'package:cinema/model/Ville.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class CinemaEvent<T> extends Equatable {
  const CinemaEvent([List props = const []]) : super();

  @override
  List<Object> get props => [];
}

class CinemaVilleLoadingEvent extends CinemaEvent {
  const CinemaVilleLoadingEvent({this.ville, this.first});
  final Ville ville;
  final bool first;

  @override
  List<Object> get props => [ville, first];
}

class CinemaClickEvent extends CinemaEvent {
  const CinemaClickEvent({this.cinema});
  final Cinema cinema;

  @override
  List<Object> get props => [cinema];
}
