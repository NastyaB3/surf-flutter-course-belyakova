import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/images.dart';
import 'package:places/widget/icon_button_widget.dart';

class SightDetails extends StatefulWidget {
  final Sight sight;

  SightDetails(this.sight, {Key key}) : super(key: key);

  @override
  _SightDetailsState createState() => _SightDetailsState();
}

class _SightDetailsState extends State<SightDetails> {
  final PageController _pageController = PageController();

  int currentPage = 0;

  @override
  void initState() {
    _initPageController();
    super.initState();
  }

  void _initPageController() {
    Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        currentPage++;
        if (currentPage > 1) {
          currentPage = 0; //пока написала currentPage = 1, потому что у меня всего 2 фотографии, когда будем работать с сетью, переделаю
        }
      });

      if (_pageController.hasClients) {
        _pageController.animateToPage(currentPage,
            duration: Duration(milliseconds: 300), curve: Curves.linear);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: false,
              expandedHeight: 360.0,
              flexibleSpace: Container(
                height: 360 + kToolbarHeight,
                width: double.infinity,
                child: Stack(
                  children: [
                    PageView(
                      controller: _pageController,
                      children: [
                        Image.network(
                          widget.sight.photo,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(child: CupertinoActivityIndicator());
                          },
                        ),
                        Image.network(
                          widget.sight.detailPhoto,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(child: CupertinoActivityIndicator());
                          },
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 2,
                            height: 7.57,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(8),
                                  topRight: Radius.circular(8)),
                              color: currentPage == 0
                                  ? Theme.of(context).primaryColor
                                  : Colors.transparent,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 2,
                            height: 7.57,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  topLeft: Radius.circular(8)),
                              color: currentPage == 1
                                  ? Theme.of(context).primaryColor
                                  : Colors.transparent,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 16, top: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.sight.name,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Row(
                          children: [
                            Text(
                              widget.sight.type.toLowerCase(),
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Text(
                              'закрыто до 09:00',
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Text(
                          widget.sight.details,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints.tightFor(height: 48),
                          child: ElevatedButton(
                            onPressed: () {
                              print('ElevationButton pressed');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  Images.icRoad,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'ПОСТРОИТЬ МАРШРУТ',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              primary: Theme.of(context).buttonColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Container(
                          height: 0.8,
                          color: ltInactiveBlack,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: BuildButton(
                                'Запланировать',
                                Images.icCalendar,
                                false,
                              ),
                            ),
                            Expanded(
                              child: BuildButton(
                                'В избранное',
                                Images.icFavorite,
                                true,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
