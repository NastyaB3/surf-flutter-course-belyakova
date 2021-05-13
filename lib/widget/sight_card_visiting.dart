import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/images.dart';
import 'package:places/ui/res/text_style.dart';

import '../mocks.dart';

class SightCardVisiting extends StatelessWidget {
  final Sight sight;
  final Function onClose;

  SightCardVisiting(this.sight, {Key key, this.onClose}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        children: [
          Stack(
            children: [
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight / 5 * 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: Image.network(
                    sight.url,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(child: CupertinoActivityIndicator());
                    },
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
              ),
              Align(
                child: Container(
                  margin: EdgeInsets.only(top: 19, right: 18),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              print('Button pressed');
                            },
                            child: SvgPicture.asset(Images.icCalendar),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 17,
                      ),
                      Container(
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              onClose(sight);
                            },
                            child: SvgPicture.asset(Images.icClose),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                alignment: Alignment.topRight,
              ),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: constraints.maxWidth / 2),
                child: Container(
                  margin: EdgeInsets.only(top: 16, left: 16),
                  child: Text(
                    sight.type.toLowerCase(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: constraints.maxWidth,
            height: constraints.maxHeight / 5 * 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16)),
              color: Theme.of(context).accentColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 16,
                ),
                Container(
                  width: 296,
                  height: 20,
                  margin: EdgeInsets.only(
                    right: 16,
                    left: 16,
                  ),
                  child: Text(
                    sight.name,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                Container(
                  width: 296,
                  height: 28,
                  margin: EdgeInsets.only(
                    right: 16,
                    left: 16,
                  ),
                  child: Text(
                    'Запланировано на 12 окт. 2021',
                    style: Theme.of(context).textTheme.bodyText2, // colorGreen
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 2,
                    right: 16,
                    left: 16,
                  ),
                  child: Text(
                    'закрыто до 09:00',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
