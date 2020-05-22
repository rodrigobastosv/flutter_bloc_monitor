import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'bloc1_event.dart';
part 'bloc1_state.dart';

class Bloc1Bloc extends Bloc<Bloc1Event, Bloc1State> {
  @override
  Bloc1State get initialState => InitialBloc1State();

  @override
  Stream<Bloc1State> mapEventToState(Bloc1Event event) async* {
    if (event is Event1) {
      yield State1();
    }
  }
}
