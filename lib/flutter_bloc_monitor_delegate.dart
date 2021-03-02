import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_monitor/model/error_info.dart';
import 'package:flutter_bloc_monitor/model/transition_info.dart';

import 'model/event_info.dart';

///Delegate that handles all the storing of the user bloc events, transitions
///and errors
class FlutterBlocMonitorDelegate extends BlocObserver {
  FlutterBlocMonitorDelegate({
    this.onErrorFunc,
    this.onEventFunc,
    this.onTransitionFunc,
  });

  static final List<EventInfo> events = [];
  static final List<TransitionInfo> transitions = [];
  static final List<ErrorInfo> errors = [];

  ///Callback to be executed when error occurs
  final Function(Bloc bloc, Object error, StackTrace stackTrace)? onErrorFunc;

  ///Callback to be executed when event occurs
  final Function(Bloc bloc, Object? event)? onEventFunc;

  ///Callback to be executed when transition occurs
  final Function(Bloc bloc, Transition transition)? onTransitionFunc;

  @override
  void onError(Bloc bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    if (onErrorFunc != null) {
      onErrorFunc!(bloc, error, stackTrace);
    }
    errors.add(
      ErrorInfo(
        bloc: bloc.runtimeType.toString(),
        error: error,
        timestamp: DateTime.now(),
        stackTrace: stackTrace,
      ),
    );
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    if (onEventFunc != null) {
      onEventFunc!(bloc, event);
    }
    events.add(
      EventInfo(
        bloc: bloc.runtimeType.toString(),
        event: event.runtimeType.toString(),
        timestamp: DateTime.now(),
      ),
    );
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    if (onTransitionFunc != null) {
      onTransitionFunc!(bloc, transition);
    }
    transitions.add(
      TransitionInfo(
        bloc: bloc.runtimeType.toString(),
        transition: transition,
        timestamp: DateTime.now(),
      ),
    );
  }
}
