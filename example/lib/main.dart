import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_monitor/flutter_bloc_monitor.dart';

import 'bloc/blocs.dart';
import 'bloc/red/red_bloc.dart';

void main() {
  Bloc.observer = FlutterBlocMonitorDelegate(
    onEventFunc: (bloc, event) => print(event),
    onTransitionFunc: (bloc, transition) => print(transition),
    onErrorFunc: (bloc, error, stacktrace) => print(error),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MultiBlocProvider(
          providers: [
            BlocProvider<RedBloc>(
              create: (_) => RedBloc(),
            ),
            BlocProvider<BlueBloc>(
              create: (_) => BlueBloc(),
            ),
            BlocProvider<GreenBloc>(
              create: (_) => GreenBloc(),
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
            BlocBuilder<RedBloc, RedState>(
              builder: (_, state) => Container(
                height: 100,
                child: Center(
                  child: RaisedButton(
                    child: Text(
                      'Add RedBloc Event',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () => context.bloc<RedBloc>().add(RedEvent1()),
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            BlocBuilder<BlueBloc, BlueState>(
              builder: (_, state) => Container(
                height: 100,
                child: Center(
                  child: RaisedButton(
                    child: Text(
                      'Add BlueBloc Event',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () => context.bloc<BlueBloc>().add(BlueEvent1()),
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            BlocBuilder<GreenBloc, GreenState>(
              builder: (_, state) => Container(
                height: 100,
                child: Center(
                  child: RaisedButton(
                    child: Text(
                      'Add GreenBloc Event',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () =>
                        context.bloc<GreenBloc>().add(GreenEvent1()),
                    color: Colors.green,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              height: 100,
              child: RaisedButton(
                color: Theme.of(context).primaryColor,
                child: Text('See Bloc Monitor Page'),
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => FlutterBlocMonitorPage(),
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
