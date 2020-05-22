import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_monitor/event_info.dart';
import 'package:flutter_bloc_monitor/flutter_bloc_monitor.dart';
import 'package:flutter_bloc_monitor/transition_info.dart';

class BlocMonitorPage extends StatefulWidget {
  @override
  _BlocMonitorPageState createState() => _BlocMonitorPageState();
}

class _BlocMonitorPageState extends State<BlocMonitorPage> {
  int chosenIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Monitor Page '),
        centerTitle: true,
      ),
      bottomNavigationBar: ConvexAppBar(
        items: [
          TabItem(icon: Icons.transform, title: 'Transitions'),
          TabItem(icon: Icons.notifications_active, title: 'Events'),
          TabItem(icon: Icons.error_outline, title: 'Errors'),
        ],
        initialActiveIndex: 1, //optional, default as 0
        onTap: (int i) => setState(() => chosenIndex = i),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    if (chosenIndex == 0) {
      return TransitionsList(FlutterMonitor.transitions);
    }
    if (chosenIndex == 1) {
      return EventsList(FlutterMonitor.events);
    }
    return Container(
      color: Colors.yellow,
    );
  }
}

class EventsList extends StatelessWidget {
  EventsList(this.listEvents);

  final List<EventInfo> listEvents;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (_, i) => ListTile(
        title: Text('${listEvents[i].bloc}: ${listEvents[i].event}'),
        subtitle: Text('${listEvents[i].timestamp.toString().substring(0, 19)}'),
      ),
      itemCount: listEvents.length,
    );
  }
}

class TransitionsList extends StatelessWidget {
  TransitionsList(this.listTransitions);

  final List<TransitionInfo> listTransitions;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (_, i) => ListTile(
        title: Text('${listTransitions[i].bloc}'),
        subtitle: Column(
          children: <Widget>[
            Text('${listTransitions[i].transition.currentState.runtimeType} -> ${listTransitions[i].transition.nextState.runtimeType}'),
            Text('${listTransitions[i].timestamp.toString().substring(0, 19)}'),
          ],
        ),
        isThreeLine: true,
      ),
      itemCount: listTransitions.length,
    );
  }
}