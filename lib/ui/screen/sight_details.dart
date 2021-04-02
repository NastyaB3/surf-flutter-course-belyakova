import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/text_style.dart';

class SightDetails extends StatelessWidget {
  final Sight sight;

  SightDetails(this.sight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 360.0,
            // backgroundColor: Colors.yellow,
            flexibleSpace: Container(
              height: 360 + kToolbarHeight,
              width: double.infinity,
              child: Image.network(
                sight.url,
                fit: BoxFit.cover,
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
                        sight.name,
                        style: textBold.copyWith(
                            fontSize: 24, color: textColorTitle),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Row(
                        children: [
                          Text(
                            sight.type.toLowerCase(),
                            style: textBold.copyWith(
                                fontSize: 14, color: textColorTitle),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Text(
                            'закрыто до 09:00',
                            style: textDescription,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Text(
                        sight.details,
                        style: textDescription.copyWith(color: textColorTitle),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Container(
                        height: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: colorGreen,
                        ),
                        child: Center(
                            child: Text(
                          'ПОСТРОИТЬ МАРШРУТ',
                          style: textBoldWhite.copyWith(fontSize: 14),
                        )),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Container(
                        height: 0.8,
                        color: lightGrey,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: _buildbtn(
                              'Запланировать',
                              Icons.calendar_today_outlined,
                              false,
                            ),
                          ),
                          Expanded(
                            child: _buildbtn(
                              'В избранное',
                              Icons.favorite_border_outlined,
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
    );
  }

  Widget _buildbtn(String title, IconData icon, bool isActive) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Row(
        children: [
          Icon(icon, color: isActive ? textColorTitle : lightGrey,),
          SizedBox(
            width: 9,
          ),
          Text(
            title,
            style: textDescription.copyWith(
                color: isActive ? textColorTitle : lightGrey),
          ),
        ],
      ),
    );
  }
}
