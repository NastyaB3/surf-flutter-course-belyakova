import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/images.dart';
import 'package:places/widget/icon_button_widget.dart';

class DetailsBottomSheet extends StatefulWidget {
  final Sight sight;

  DetailsBottomSheet(this.sight, {Key key}) : super(key: key);

  @override
  _DetailsBottomSheetState createState() => _DetailsBottomSheetState();
}

class _DetailsBottomSheetState extends State<DetailsBottomSheet> {
  final PageController _pageController = PageController();
  final ScrollController controller = ScrollController();
  int _currentPage = 0;

  @override
  void initState() {
    _initPageController();
    super.initState();
  }

  void _initPageController() {
    Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        _currentPage++;
        if (_currentPage > 1) {
          _currentPage = 0;
        }
      });

      if (_pageController.hasClients) {
        _pageController.animateToPage(_currentPage,
            duration: Duration(milliseconds: 300), curve: Curves.linear);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                topLeft: Radius.circular(16),
              ),
            ),
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
                Container(
                  padding: EdgeInsets.only(top: 12),
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: SvgPicture.asset(
                        Images.icMinimize,
                      )),
                ),
                Container(
                  padding: EdgeInsets.only(top: 16, right: 16),
                  child: Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset(
                          Images.icCardClose,
                        ),
                      )),
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
                          color: _currentPage == 0
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
                          color: _currentPage == 1
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
          Container(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              widget.sight.name,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Container(
            padding: EdgeInsets.only(left: 16),
            child: Row(
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
          ),
          SizedBox(
            height: 24,
          ),
          Container(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              widget.sight.details,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Container(
            padding: EdgeInsets.only(left: 16),
            child: ConstrainedBox(
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
          Container(
            padding: EdgeInsets.only(left: 16),
            child: Row(
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
          ),
          SizedBox(
            height: 20 + MediaQuery.of(context).padding.bottom,
          ),
        ],
      ),
    );
  }
}
