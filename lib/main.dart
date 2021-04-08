import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/screen/sight_card.dart';
import 'package:places/ui/screen/sight_details.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/ui/screen/visiting_screen.dart';

void main() {
  runApp(MainApp());
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
      theme: ThemeData(),
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

