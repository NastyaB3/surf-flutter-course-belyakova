import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/images.dart';

class TutorialCard extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;


 TutorialCard(this.image, this.title, this.subTitle, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(image),
        SizedBox(
          height: 42.6,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.headline5,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          subTitle,
          style: Theme.of(context).textTheme.bodyText2,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 117,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 8,
                width: 24,
                decoration: BoxDecoration(
                    color: Theme.of(context).buttonColor,
                    borderRadius: BorderRadius.circular(8))),
            SizedBox(
              width: 8,
            ),
            Container(
              height: 8,
              width: 8,
              decoration: BoxDecoration(
                  color: ltInactiveBlack,
                  borderRadius: BorderRadius.circular(8)),
            ),
            SizedBox(
              width: 8,
            ),
            Container(
              height: 8,
              width: 8,
              decoration: BoxDecoration(
                  color: ltInactiveBlack,
                  borderRadius: BorderRadius.circular(8)),
            ),
          ],
        ),
      ],
    );
  }
}
