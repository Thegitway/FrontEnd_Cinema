import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class SampleEvent<T> extends Equatable {
  const SampleEvent([List props = const []]) : super();

  @override
  List<Object> get props => [];
}

class SampleSubEvent extends SampleEvent {
  const SampleSubEvent();

  @override
  List<Object> get props => [];
}
