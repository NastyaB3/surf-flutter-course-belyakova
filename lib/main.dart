import 'package:flutter/material.dart';
import 'package:places/ui/screen/sight_list_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Places',
      theme: new ThemeData(
      ),
      home: SightListScreen(),
    );
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


