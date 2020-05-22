import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'bloc3_event.dart';
part 'bloc3_state.dart';

class Bloc3Bloc extends Bloc<Bloc3Event, Bloc3State> {
  @override
  Bloc3State get initialState => InitialBloc3State();

  @override
  Stream<Bloc3State> mapEventToState(Bloc3Event event) async* {
    if (event is Event3) {
      yield State3();
    }
  }
}
