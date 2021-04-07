import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/text_style.dart';

class SightCardVisited extends StatelessWidget {
  final Sight sight;

  SightCardVisited(this.sight);

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
                  color: backColorLight,
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
                        width: 24,
                        height: 24,
                        child: Icon(
                          Icons.share,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Container(
                        width: 24,
                        height: 24,
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
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
                    style: textBoldWhite.copyWith(fontSize: 12),
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
              color: backColorLight,
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
                    style: textTitle,
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
                    'Цель достигнута 12 окт. 2020',
                    style: textDescription,
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
                    style: textDescription,
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
