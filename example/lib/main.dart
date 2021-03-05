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
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.red,
                      ),
                    ),
                    child: Text(
                      'Add RedBloc Event',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () => context.read<RedBloc>().add(RedEvent1()),
                  ),
                ),
              ),
            ),
            BlocBuilder<BlueBloc, BlueState>(
              builder: (_, state) => Container(
                height: 100,
                child: Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.blue,
                      ),
                    ),
                    child: Text(
                      'Add BlueBloc Event',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () => context.read<BlueBloc>().add(BlueEvent1()),
                  ),
                ),
              ),
            ),
            BlocBuilder<GreenBloc, GreenState>(
              builder: (_, state) => Container(
                height: 100,
                child: Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.green,
                      ),
                    ),
                    child: Text(
                      'Add GreenBloc Event',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () =>
                        context.read<GreenBloc>().add(GreenEvent1()),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              height: 100,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Theme.of(context).primaryColor,
                  ),
                ),
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
