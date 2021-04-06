import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/text_style.dart';

class SightCard extends StatelessWidget {
  final Sight sight;

  SightCard(this.sight);

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
                  child: Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.white,
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
                  margin: EdgeInsets.only(
                    bottom: 16,
                    right: 16,
                    left: 16,
                    top: 2,
                  ),
                  child: Text(
                    sight.details,
                    style: textDescription,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
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
