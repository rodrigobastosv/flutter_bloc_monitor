import 'package:flutter/material.dart';
import 'package:flutter_bloc_monitor/model/event_info.dart';

class EventsList extends StatelessWidget {
  EventsList(this.listEvents);

  final List<EventInfo> listEvents;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (_, i) => ListTile(
        title: Text('${listEvents[i].bloc}: ${listEvents[i].event}'),
        subtitle:
            Text('${listEvents[i].timestamp.toString().substring(0, 19)}'),
      ),
      itemCount: listEvents.length,
    );
  }
}
