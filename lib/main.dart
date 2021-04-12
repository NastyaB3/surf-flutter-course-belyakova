import 'package:flutter/material.dart';

import 'package:places/ui/screen/res/themes.dart';

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
  bool isDarkMode = false;

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
      debugShowCheckedModeBanner: false,
      title: 'Places',
      theme: isDarkMode ? darkTheme: lightTheme,
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
              type: BottomNavigationBarType.fixed,
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

