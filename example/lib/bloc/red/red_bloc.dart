import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'red_event.dart';
part 'red_state.dart';

class RedBloc extends Bloc<RedEvent, RedState> {
  @override
  RedState get initialState => InitialRedState();

  @override
  Stream<RedState> mapEventToState(RedEvent event) async* {
    if (event is RedEvent1) {
      yield RedState1();
    }
  }
}
