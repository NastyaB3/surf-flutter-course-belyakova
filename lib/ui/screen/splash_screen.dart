import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/res/images.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _navigateToNext() async {
    await isInitialized();
    print('Переход на следующий экран');
  }

  Future<bool> isInitialized() async {
    await Future.delayed(Duration(seconds: 2));
    return Future.value(true);
  }

  @override
  void initState() {
    super.initState();
    _navigateToNext();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.topRight,
                  colors: [
                    Theme.of(context).indicatorColor,
                    Theme.of(context).buttonColor
                  ]),
            ),
          ),
          Center(child: SvgPicture.asset(Images.icMapBg)),
        ],
      ),
    );
  }
}
