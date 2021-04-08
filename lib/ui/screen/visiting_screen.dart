import 'package:flutter/material.dart';

import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/text_style.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/widget/sight_card_visited.dart';

import 'package:places/widget/sight_card_visiting.dart';

import '../../mocks.dart';

class VisitingScreen extends StatefulWidget {
  @override
  _VisitingScreenState createState() => _VisitingScreenState();
}

class _VisitingScreenState extends State<VisitingScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 120,
          elevation: 0,
          title: Container(
            child: Text(
              'Избранное',
              style: textSubTitle,
            ),
          ),
          bottom: PreferredSize(
            child: Container(
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: backColorLight,
              ),
              child: TabBar(
                unselectedLabelColor: lightGrey,
                indicator: BoxDecoration(
                  color: textColorTitle,
                  borderRadius: BorderRadius.circular(40),
                ),
                tabs: [
                  Container(
                    child: Tab(
                      child: Container(
                        child: Center(
                          child: Text(
                            'Хочу посетить',
                          ),
                        ),
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Tab(
                      child: Container(
                        child: Center(
                          child: Text(
                            'Посетил',
                          ),
                        ),
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            buildListVisiting(),
            buildListVisited(),
          ],
        ),
      ),
    );
  }

  Widget buildListVisiting() {
    if (mocks.isNotEmpty) {
      return Center(
        child: SingleChildScrollView(
          child: Column(children: [
            for (var sight in mocks)
              Container(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: AspectRatio(
                  aspectRatio: 3 / 2,
                  child: SightCardVisiting(sight),
                ),
              ),
          ]),
        ),
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.camera_alt,
            size: 54,
            color: lightGrey,
          ),
          Container(
            child: Text(
              'Пусто',
              style: textSubTitleLight,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "Отмечайте понравившиеся\nместа и они появятся здесь",
            style: textSubTitleLight.copyWith(fontSize: 14),
          ),
        ],
      );
    }
  }

  Widget buildListVisited() {
    if (mocks.isNotEmpty) {
      return Center(
        child: SingleChildScrollView(
          child: Column(children: [
            for (var sight in mocks)
              Container(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: AspectRatio(
                  aspectRatio: 3 / 2,
                  child: SightCardVisited(sight),
                ),
              ),
          ]),
        ),
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.alt_route,
            size: 54,
            color: lightGrey,
          ),
          Container(
            child: Text(
              'Пусто',
              style: textSubTitleLight,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "Завершите маршрут,\nчтобы место попало сюда",
            style: textSubTitleLight.copyWith(fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ],
      );
    }
  }
}
