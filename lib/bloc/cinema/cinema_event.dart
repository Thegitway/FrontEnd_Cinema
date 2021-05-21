import 'package:cinema/model/Ville.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class CinemaEvent<T> extends Equatable {
  const CinemaEvent([List props = const []]) : super();

  @override
  List<Object> get props => [];
}

class CinemaLoadingEvent extends CinemaEvent {
  const CinemaLoadingEvent({this.ville, this.first});
  final Ville ville;
  final bool first;

  @override
  List<Object> get props => [ville, first];
}
