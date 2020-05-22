part of 'counter_bloc.dart';

@immutable
abstract class CounterState {}

class InitialCounterState extends CounterState {}

class ValueIncremented extends CounterState {
  ValueIncremented(this.value);

  final int value;
}