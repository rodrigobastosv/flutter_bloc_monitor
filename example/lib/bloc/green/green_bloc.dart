import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'green_event.dart';
part 'green_state.dart';

class GreenBloc extends Bloc<GreenEvent, GreenState> {
  GreenBloc() : super(InitialGreenState());

  @override
  Stream<GreenState> mapEventToState(GreenEvent event) async* {
    if (event is GreenEvent1) {
      yield GreenState1();
    }
  }
}
