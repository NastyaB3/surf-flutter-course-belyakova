import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/domain/sight.dart';
import 'package:places/search_history.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/images.dart';
import 'package:places/ui/res/text_style.dart';
import 'package:places/ui/screen/sight_details.dart';
import 'package:places/widget/search_bar.dart';
import 'package:places/widget/search_item_widget.dart';
import '../../search.dart';

class SightSearchScreen extends StatefulWidget {
  @override
  _SightSearchScreenState createState() => _SightSearchScreenState();
}

class _SightSearchScreenState extends State<SightSearchScreen>
    with TickerProviderStateMixin {
  List<Sight> searchResult = [];
  String _searchText = "";
  bool isLoading = false;
  AnimationController animationController;

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: new Duration(seconds: 2), vsync: this);
    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBar(
        statusBarHeight: MediaQuery.of(context).padding.top,
        onChange: (text) {
          setState(() {
            _searchText = text;
          });
          search(text);
        },
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    if (isLoading) {
      return Center(
        child: CircularProgressIndicator(
          valueColor: animationController.drive(ColorTween(
              begin: Theme.of(context).indicatorColor,
              end: Theme.of(context).buttonColor)),
        ),
      );
    }
    if (_searchText.isEmpty && SearchHistory.history.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 24, left: 16),
            child: Text(
              'ВЫ ИСКАЛИ',
              style: textSuperSmall.copyWith(color: ltInactiveBlack),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: SearchHistory.history.length,
            itemBuilder: (BuildContext context, int index) {
              String listData = SearchHistory.history[index];
              return Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 16, top: 19),
                        child: Text(
                          listData.toString(),
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          setState(() {
                            SearchHistory.history.remove(listData);
                          });
                        },
                        child: Container(
                            padding: EdgeInsets.only(right: 24, top: 19),
                            child: SvgPicture.asset(
                              Images.icClose,
                              color: ltInactiveBlack,
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    height: 0.8,
                    color: ltInactiveBlack,
                  ),
                ],
              );
            },
          ),
          InkWell(
            onTap: () {
              setState(() {
                SearchHistory.history.clear();
              });
            },
            child: Container(
              padding: EdgeInsets.only(left: 16, top: 16),
              child: Text(
                'Очистить историю',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(color: Theme.of(context).buttonColor),
              ),
            ),
          )
        ],
      );
    }
    if (searchResult.isNotEmpty) {
      return ListView.separated(
          padding: EdgeInsets.only(top: 38),
          separatorBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(left: 88, right: 16),
              height: 0.8,
              color: ltInactiveBlack,
            );
          },
          itemCount: searchResult.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SightDetails(searchResult[index]),
                    ),
                  );
                  SearchHistory.history.add(searchResult[index].name);
                },
                child: SearchItemWidget(searchResult[index]));
          });
    } else {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Container(
                width: 50.83,
                height: 48,
                child: SvgPicture.asset(Images.icSearch)),
            SizedBox(
              height: 32,
            ),
            Text(
              'Ничего не найдено.',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: ltInactiveBlack),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Попробуйте изменить параметры\nпоиска',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  .copyWith(color: ltInactiveBlack),
            ),
            Spacer(),
          ],
        ),
      );
    }
  }

  void search(String query) async {
    setState(() {
      isLoading = true;
      searchResult = Search.search(
          query: query,
          positionFrom: Search.positionFrom,
          positionTo: Search.positionTo,
          filters: Search.filters);
    });

    await Future.delayed(Duration(seconds: 3));

    setState(() {
      isLoading = false;
    });
  }
}
