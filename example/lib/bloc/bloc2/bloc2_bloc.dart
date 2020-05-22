import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'bloc2_event.dart';
part 'bloc2_state.dart';

class Bloc2Bloc extends Bloc<Bloc2Event, Bloc2State> {
  @override
  Bloc2State get initialState => InitialBloc2State();

  @override
  Stream<Bloc2State> mapEventToState(Bloc2Event event) async* {
    if (event is Event2) {
      yield State2();
    }
  }
}
