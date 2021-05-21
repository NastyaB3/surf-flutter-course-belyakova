import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/images.dart';

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
              onPressed: () {},
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(Images.icTutorial_1),
              SizedBox(
                height: 42.6,
              ),
              Text(
                'Добро пожаловать\nв Путеводитель',
                style: Theme.of(context).textTheme.headline5,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Ищи новые локации и сохраняй\nсамые любимые.',
                style: Theme.of(context).textTheme.bodyText2,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 117,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 8,
                      width: 24,
                      decoration: BoxDecoration(
                          color: Theme.of(context).buttonColor,
                          borderRadius: BorderRadius.circular(8))),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                        color: ltInactiveBlack,
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                        color: ltInactiveBlack,
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(Images.icTutorial_2),
              SizedBox(
                height: 42.6,
              ),
              Text(
                'Построй маршрут\nи отправляйся в путь',
                style: Theme.of(context).textTheme.headline5,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Достигай цели максимально\nбыстро и комфортно.',
                style: Theme.of(context).textTheme.bodyText2,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 117,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                        color: ltInactiveBlack,
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                      height: 8,
                      width: 24,
                      decoration: BoxDecoration(
                          color: Theme.of(context).buttonColor,
                          borderRadius: BorderRadius.circular(8))),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                        color: ltInactiveBlack,
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(Images.icTutorial_3),
              SizedBox(
                height: 42.6,
              ),
              Text(
                'Добавляй места,\nкоторые нашёл сам',
                style: Theme.of(context).textTheme.headline5,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Делись самыми интересными\nи помоги нам стать лучше!',
                style: Theme.of(context).textTheme.bodyText2,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 117,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                        color: ltInactiveBlack,
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                        color: ltInactiveBlack,
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                      height: 8,
                      width: 24,
                      decoration: BoxDecoration(
                          color: Theme.of(context).buttonColor,
                          borderRadius: BorderRadius.circular(8))),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
