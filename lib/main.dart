import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // static const number = 10 ^ 8;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            child: CircularProgressIndicator(),
            height: 200.0,
            width: 200.0,
          ),
          Column(
            children: [
              TextButton(
                child: Text(
                  'Start task by main isolate',
                  style: TextStyle(height: 2, fontSize: 30),
                ),
                onPressed: () async {
                  final _stopwatch = Stopwatch()..start();
                  _heavyTask(pow(10, 9).toInt());
                  _stopwatch.stop();
                  print(
                      'elapsed total: ${_stopwatch.elapsedMilliseconds} msec');
                },
              ),
              TextButton(
                child: Text(
                  'Start task w/ new isolate',
                  style: TextStyle(height: 2, fontSize: 30),
                ),
                onPressed: () async {
                  final _stopwatch = Stopwatch()..start();
                  await compute(_heavyTask, pow(10, 9).toInt());
                  _stopwatch.stop();
                  print(
                      'elapsed total: ${_stopwatch.elapsedMilliseconds} msec');
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}

void _heavyTask(int val) {
  final _stopwatch = Stopwatch()..start();
  for (int i = 0; i <= val; ++i) {
    if (i == val) print('Finished heavyTask!');
  }
  _stopwatch.stop();
  print('elapsed: ${_stopwatch.elapsedMilliseconds} msec');
}
