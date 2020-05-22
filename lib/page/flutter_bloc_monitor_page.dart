import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import '../flutter_bloc_monitor.dart';
import '../widget/widgets.dart';

class FlutterBlocMonitorPage extends StatefulWidget {
  @override
  _FlutterBlocMonitorPageState createState() => _FlutterBlocMonitorPageState();
}

class _FlutterBlocMonitorPageState extends State<FlutterBlocMonitorPage> {
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
        initialActiveIndex: 1,
        onTap: (int i) => setState(() => chosenIndex = i),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    if (chosenIndex == 0) {
      return TransitionsList(FlutterBlocMonitorDelegate.transitions);
    }
    if (chosenIndex == 1) {
      return EventsList(FlutterBlocMonitorDelegate.events);
    }
    return ErrorsList(FlutterBlocMonitorDelegate.errors);
  }
}
