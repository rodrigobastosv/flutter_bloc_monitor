import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_monitor/flutter_bloc_monitor.dart';

import 'bloc/blocs.dart';

void main() {
  BlocSupervisor.delegate = FlutterBlocMonitorDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MultiBlocProvider(
          providers: [
            BlocProvider<Bloc1Bloc>(
              create: (_) => Bloc1Bloc(),
            ),
            BlocProvider<Bloc2Bloc>(
              create: (_) => Bloc2Bloc(),
            ),
            BlocProvider<Bloc3Bloc>(
              create: (_) => Bloc3Bloc(),
            ),
          ],
          child: SampleWidget(),
        ),
      ),
    );
  }
}

class SampleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            RaisedButton(
              color: Theme.of(context).primaryColor,
              child: Text('See Bloc Monitor Page'),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => FlutterBlocMonitorPage(),
                ),
              ),
            ),
            BlocBuilder<Bloc1Bloc, Bloc1State>(
              builder: (_, state) => Expanded(
                child: Container(
                  child: Center(
                    child: RaisedButton(
                      child: Text('Event Bloc1'),
                      onPressed: () => context.bloc<Bloc1Bloc>().add(Event1()),
                    ),
                  ),
                ),
              ),
            ),
            BlocBuilder<Bloc2Bloc, Bloc2State>(
              builder: (_, state) => Expanded(
                child: Container(
                  child: Center(
                    child: RaisedButton(
                      child: Text('Event Bloc2'),
                      onPressed: () => context.bloc<Bloc2Bloc>().add(Event2()),
                    ),
                  ),
                ),
              ),
            ),
            BlocBuilder<Bloc3Bloc, Bloc3State>(
              builder: (_, state) => Expanded(
                child: Container(
                  child: Center(
                    child: RaisedButton(
                      child: Text('Event Bloc3'),
                      onPressed: () => context.bloc<Bloc3Bloc>().add(Event3()),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
