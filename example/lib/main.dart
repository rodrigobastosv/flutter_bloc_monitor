import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_monitor/bloc_monitor_page.dart';
import 'package:flutter_bloc_monitor/flutter_bloc_monitor.dart';

import 'counter/counter_bloc.dart';
import 'random/random_bloc.dart';

void main() {
  BlocSupervisor.delegate = FlutterMonitor();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: BlocProvider<CounterBloc>(
          create: (_) => CounterBloc(),
          child: BlocProvider<RandomBloc>(
            create: (_) => RandomBloc(),
            child: CounterWidget(),
          ),
        ),
      ),
    );
  }
}

class CounterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (_, state) => SafeArea(
        child: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                RaisedButton(
                  onPressed: () =>
                      BlocProvider.of<CounterBloc>(context).add(Increment()),
                  child: Text('+'),
                ),
                RaisedButton(
                  onPressed: () =>
                      BlocProvider.of<RandomBloc>(context).add(RandomStuff()),
                  child: Text('Random'),
                ),
                RaisedButton(
                  onPressed: () {
                    print(FlutterMonitor.events);
                    print(FlutterMonitor.transitions);
                    print(FlutterMonitor.errors);
                  },
                  child: Text('Info'),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => BlocMonitorPage(),
                      ),
                    );
                  },
                  child: Text('Info'),
                ),
                if (state is ValueIncremented) Text('${state.value}')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
