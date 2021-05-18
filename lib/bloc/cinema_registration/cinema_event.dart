import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class CinemaEvent<T> extends Equatable {
  const CinemaEvent([List props = const []]) : super();

  @override
  List<Object> get props => [];
}

class CinemaSubEvent extends CinemaEvent {
  const CinemaSubEvent();

  @override
  List<Object> get props => [];
}
