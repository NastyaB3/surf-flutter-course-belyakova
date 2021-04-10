import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/widget/icon_button_widget.dart';

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
            flexibleSpace: Container(
              height: 360 + kToolbarHeight,
              width: double.infinity,
              child: Image.network(
                sight.url,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(child: CupertinoActivityIndicator());
                },
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
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Row(
                        children: [
                          Text(
                            sight.type.toLowerCase(),
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
                        sight.details,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Container(
                        height: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: ltColorGreen,
                        ),
                        child: Center(
                            child: Text(
                          'ПОСТРОИТЬ МАРШРУТ',
                          style: Theme.of(context).textTheme.bodyText1,
                        )),
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
                              Icons.calendar_today_outlined,
                              false,
                            ),
                          ),
                          Expanded(
                            child: BuildButton(
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
}
