import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/images.dart';

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
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
              ),
              Align(
                child: Container(
                  child: TextButton(
                    onPressed: (){
                      print('Button pressed');
                    },
                    child: SvgPicture.asset(Images.icFavorite, color: Colors.white,),
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
                  margin: EdgeInsets.only(
                    bottom: 16,
                    right: 16,
                    left: 16,
                    top: 2,
                  ),
                  child: Text(
                    sight.details,
                    style: Theme.of(context).textTheme.bodyText2,
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
