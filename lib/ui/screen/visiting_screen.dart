import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/colors.dart';
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
        appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          toolbarHeight: 120,
          elevation: 0,
          title: Container(
            child: Center(
              child: Text(
                'Избранное',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
          bottom: PreferredSize(
            child: Container(
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Theme.of(context).accentColor,
              ),
              child: TabBar(
                unselectedLabelColor: ltInactiveBlack,
                indicator: BoxDecoration(
                  color: Theme.of(context).primaryColor,
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
      return SingleChildScrollView(
        child: Column(children: [
          for (var sight in mocks)
            DragTarget(onWillAccept: (Sight data) {
              return true;
            }, onAccept: (Sight data) {
              setState(() {
                int indexSight = mocks.indexOf(sight);
                int indexData = mocks.indexOf(data);
                mocks[indexSight] = data;
                mocks[indexData] = sight;
              });
            }, builder: (context, candidateData, rejectData) {
              return LongPressDraggable<Sight>(
                data: sight,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: AspectRatio(
                    aspectRatio: 3 / 2,
                    child: SightCardVisiting(
                      sight,
                      onClose: (sight) {
                        setState(() {
                          mocks.remove(sight);
                        });
                      },
                    ),
                  ),
                ),
                feedback: Container(
                  height: MediaQuery.of(context).size.width * 2 / 3,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: SightCardVisiting(
                    sight,
                    onClose: (sight) {
                      setState(() {
                        mocks.remove(sight);
                      });
                    },
                  ),
                ),
              );
            }),
        ]),
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.camera_alt,
            size: 54,
            color: ltInactiveBlack,
          ),
          Container(
            child: Text(
              'Пусто',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "Отмечайте понравившиеся\nместа и они появятся здесь",
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ],
      );
    }
  }

  Widget buildListVisited() {
    if (mocks.isNotEmpty) {
      return SingleChildScrollView(
        child: Column(children: [
          for (var sight in mocks)
            DragTarget(onWillAccept: (Sight data) {
              return true;
            }, onAccept: (Sight data) {
              setState(() {
                int indexData = mocks.indexOf(data);
                int indexSight = mocks.indexOf(sight);
                mocks[indexSight] = data;
                mocks[indexData] = sight;
              });
            }, builder: (context, candidateDate, rejectedDate) {
              return LongPressDraggable(
                data: sight,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: AspectRatio(
                    aspectRatio: 3 / 2,
                    child: SightCardVisited(
                      sight,
                      onClose: (sight) {
                        setState(() {
                          mocks.remove(sight);
                        });
                      },
                      key: ValueKey('Text'),
                    ),
                  ),
                ),
                feedback: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width * 2 / 3,
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: SightCardVisited(
                    sight,
                    onClose: (sight) {
                      setState(() {
                        mocks.remove(sight);
                      });
                    },
                  ),
                ),
              );
            }),
        ]),
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.alt_route,
            size: 54,
            color: ltInactiveBlack,
          ),
          Container(
            child: Text(
              'Пусто',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "Завершите маршрут,\nчтобы место попало сюда",
            style: Theme.of(context).textTheme.bodyText2,
            textAlign: TextAlign.center,
          ),
        ],
      );
    }
  }
}
