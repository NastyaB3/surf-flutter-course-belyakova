import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StateWidget',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyStateFull(),
    );
  }
}


class MyFirstWidget extends StatelessWidget {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    counter++;
    print(counter);
    return Container(
      child: Center(
        child: Text('Hello'),
      ),
    );
  }
  testContext() {
    return context.runtimeType;
  }
}


class MyStateFull extends StatefulWidget {
  @override
  _MyStateFullState createState() => _MyStateFullState();
}

class _MyStateFullState extends State<MyStateFull> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    counter ++;
    print(counter);
    return Container(child: Center(
      child: Text('Hello'),

    ),);
  }
  testContextFull() {
    return context.runtimeType;
  }
}


