import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Heavy Task App'),
        ),
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            child: CircularProgressIndicator(
              strokeWidth: 18.0,
            ),
            height: 200.0,
            width: 200.0,
          ),
          Column(
            children: [
              ElevatedButton(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text(
                    'Heavy Task',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueGrey,
                  onPrimary: Colors.white,
                ),
                onPressed: () async {
                  final _stopwatch = Stopwatch()..start();
                  _heavyTask(pow(10, 9).toInt());
                  _stopwatch.stop();
                  print(
                      'elapsed total: ${_stopwatch.elapsedMilliseconds} msec');
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text(
                    'Heavy task\nw/ new isolate',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red[300],
                  onPrimary: Colors.white,
                ),
                onPressed: () async {
                  final _stopwatch = Stopwatch()..start();
                  await compute(_heavyTask, pow(10, 9).toInt());
                  _stopwatch.stop();
                  print(
                      'elapsed total: ${_stopwatch.elapsedMilliseconds} msec');
                },
              ),
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
