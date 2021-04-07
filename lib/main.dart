import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/screen/sight_card.dart';
import 'package:places/ui/screen/sight_details.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/ui/screen/visiting_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainApp();
  }
}

class MainApp extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<MainApp> {
  int currentIndex = 0;

  Widget buildBody() {
    if (currentIndex == 0) {
      return SightListScreen();
    } else if (currentIndex == 2) {
      return VisitingScreen();
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Places',
      theme: new ThemeData(),
      home: Stack(
        children: [
          buildBody(),
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomNavigationBar(
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              unselectedItemColor: Colors.grey,
              selectedItemColor: textColorTitle,
              currentIndex: currentIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.list_alt_sharp),
                  title: Text(''),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.map),
                  title: Text(''),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  title: Text(''),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  title: Text(''),
                ),
              ],
            ),
          ),
        ],
      ),
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
    counter++;
    print(counter);
    return Container(
      child: Center(
        child: Text('Hello'),
      ),
    );
  }

  testContextFull() {
    return context.runtimeType;
  }
}
