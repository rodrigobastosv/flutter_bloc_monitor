import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'blue_event.dart';
part 'blue_state.dart';

class BlueBloc extends Bloc<BlueEvent, BlueState> {
  @override
  BlueState get initialState => InitialBlueState();

  @override
  Stream<BlueState> mapEventToState(BlueEvent event) async* {
    if (event is BlueEvent1) {
      yield BlueState1();
    }
  }
}
