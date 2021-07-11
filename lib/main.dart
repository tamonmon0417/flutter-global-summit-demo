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
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(),
          Column(
            children: [
              TextButton(
                child: Text('Start'),
                onPressed: () async {
                  heavyTask(1000000000);
                },
              ),
              TextButton(
                child: Text('Start with compute'),
                onPressed: () async {
                  await compute(heavyTask, 1000000000);
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}

void heavyTask(int val) {
  final stopwatch = Stopwatch()..start();
  for (int i = 0; i <= val; ++i) {
    if (i == val) print('Finished heavyTask!');
  }
  stopwatch.stop();
  print('elapsed: ${stopwatch.elapsedMilliseconds} msec');
}
