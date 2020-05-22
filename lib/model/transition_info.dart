import 'package:flutter_bloc/flutter_bloc.dart';

class TransitionInfo {
  TransitionInfo({this.bloc, this.transition, this.timestamp});

  final String bloc;
  final Transition transition;
  final DateTime timestamp;

  @override
  String toString() {
    return 'Bloc $bloc transited from state ${transition.currentState.runtimeType} to ${transition.nextState.runtimeType} on $timestamp';
  }
}