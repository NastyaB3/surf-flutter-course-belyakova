import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/images.dart';
import 'package:places/ui/screen/filters_screen.dart';
import 'package:places/ui/screen/sight_card.dart';
import 'package:places/ui/screen/sight_details.dart';
import 'package:places/ui/screen/sight_search_screen.dart';

import '../../mocks.dart';
import 'add_sight_screen.dart';

class SightListScreen extends StatefulWidget {
  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        title: Container(
          child: Center(
            child: Text(
              'Список интересных мест',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Column(
          children: [
            Container(
                color: Colors.white,
                padding: EdgeInsets.only(right: 16, left: 16),
                child: ConstrainedBox(
                  constraints: BoxConstraints.tightFor(height: 40),
                  child: Container(
                    color: Colors.transparent,
                    child: Stack(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SightSearchScreen()));
                          },
                          child: TextField(
                            enableInteractiveSelection: false,
                            showCursor: false,
                            autofocus: false,
                            decoration: InputDecoration(
                              hintText: 'Поиск',
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .copyWith(
                                      color: ltInactiveBlack,
                                      fontWeight: FontWeight.w400),
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 10.0),
                              filled: true,
                              enabled: false,
                              fillColor: backColorLight,
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: backColorLight,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: backColorLight,
                                ),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: backColorLight,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                borderSide: BorderSide(
                                  width: 2,
                                  color: backColorLight,
                                ),
                              ),
                              prefixIcon: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SightSearchScreen()));
                                },
                                icon: Container(
                                  child: SvgPicture.asset(
                                    Images.icSearch,
                                    color: ltInactiveBlack,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FiltersScreen()));
                            },
                            icon: Container(
                              child: SvgPicture.asset(
                                Images.icFilter,
                                color: ltColorGreen,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
            Expanded(
              child: Stack(
                children: [
                  ListView.builder(
                      itemCount: mocks.length,
                      itemBuilder: (context, index) {
                        final sight = mocks[index];
                        return Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(16),
                            child: AspectRatio(
                              aspectRatio: 3 / 2,
                              child: SightCard(sight),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SightDetails(sight),
                                ),
                              );
                            },
                          ),
                        );
                      }),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: EdgeInsets.only(bottom: 16),
                      margin: EdgeInsets.only(
                          bottom: kBottomNavigationBarHeight +
                              MediaQuery.of(context).padding.bottom),
                      child: ConstrainedBox(
                        constraints:
                            BoxConstraints.tightFor(width: 177, height: 48),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            padding: EdgeInsets.all(0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddSightScreen()));
                          },
                          child: Container(
                            width: 177,
                            height: 48,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              gradient: LinearGradient(
                                colors: <Color>[
                                  Color(0xFF4CAF50),
                                  Color(0xFFFCDD3D),
                                ],
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  Images.plusPng,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'НОВОЕ МЕСТО',
                                  style: Theme.of(context)
                                      .textTheme
                                      .button
                                      .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
