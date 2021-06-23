import 'dart:async';
import 'package:flutter/material.dart';
import 'package:places/main.dart';
import 'package:places/ui/res/images.dart';
import 'package:places/widget/tutorial_card.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _pageController = PageController();
  int currentPage = 0;

  @override
  void initState() {
    _initPageController();
    super.initState();
  }

  void _initPageController() {
    Timer.periodic(Duration(seconds: 3), (timer) {
      currentPage++;
      if (currentPage > 2) {
        currentPage = 0;
      }

      if (_pageController.hasClients) {
        _pageController.animateToPage(currentPage,
            duration: Duration(milliseconds: 200), curve: Curves.linear);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Container(
            padding: EdgeInsets.only(right: 16),
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainScreen(),
                  ),
                );
              },
              child: Text(
                'Пропустить',
                style: Theme.of(context)
                    .textTheme
                    .button
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        children: [
          TutorialCard(Images.icTutorial_1, 'Добро пожаловать\nв Путеводитель',
              'Ищи новые локации и сохраняй\nсамые любимые.'),
          TutorialCard(
              Images.icTutorial_2,
              'Построй маршрут\nи отправляйся в путь',
              'Достигай цели максимально\nбыстро и комфортно.'),
          TutorialCard(
            Images.icTutorial_3,
            'Добавляй места,\nкоторые нашёл сам',
            'Делись самыми интересными\nи помоги нам стать лучше!',
          ),
        ],
      ),
    );
  }
}
