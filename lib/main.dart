import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/res/images.dart';
import 'package:places/ui/screen/filters_screen.dart';

import 'package:places/ui/screen/res/themes.dart';
import 'package:places/ui/screen/settings_screen.dart';

import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/ui/screen/splash_screen.dart';
import 'package:places/ui/screen/visiting_screen.dart';

ThemeChanger themeChanger = ThemeChanger();

void main() {
  runApp(MainApp());
}

class ThemeChanger extends ChangeNotifier {
  bool isDarkMode = false;

  void setDarkMode(bool isDark) {
    isDarkMode = isDark;
    notifyListeners();
  }
}

class MainApp extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<MainApp> {
  int currentIndex = 0;
  bool isDarkMode = false;

  @override
  void initState() {
    themeChanger.addListener(() {
      setState(() {
        isDarkMode = themeChanger.isDarkMode;
      });
    });
    super.initState();
  }

  Widget buildBody() {
    if (currentIndex == 0) {
      return SightListScreen();
    } else if (currentIndex == 2) {
      return VisitingScreen();
    } else if (currentIndex == 3) {
      return SettingsScreen();
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Places',
      theme: isDarkMode ? darkTheme : lightTheme,
      // home: SplashScreen(),
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
                  icon: SvgPicture.asset(Images.icList),
                  title: Text(''),
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(Images.icMap),
                  title: Text(''),
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(Images.icFavorite),
                  title: Text(''),
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(Images.icSetting),
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
