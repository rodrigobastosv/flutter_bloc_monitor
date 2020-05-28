import 'package:flutter/material.dart';
import 'package:flutter_bloc_monitor/model/transition_info.dart';

class TransitionsList extends StatelessWidget {
  TransitionsList(this.listTransitions);

  final List<TransitionInfo> listTransitions;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (_, i) => ListTile(
        title: Text(
            '${listTransitions[i].bloc}: ${listTransitions[i].transition.currentState.runtimeType} -> ${listTransitions[i].transition.nextState.runtimeType}'),
        subtitle:
            Text('${listTransitions[i].timestamp.toString().substring(0, 19)}'),
        dense: true,
      ),
      itemCount: listTransitions.length,
    );
  }
}
