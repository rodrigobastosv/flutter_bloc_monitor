import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'random_event.dart';
part 'random_state.dart';

class RandomBloc extends Bloc<RandomEvent, RandomState> {
  @override
  RandomState get initialState => InitialRandomState();

  @override
  Stream<RandomState> mapEventToState(
    RandomEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
