import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/text_style.dart';

class BuildButton extends StatelessWidget {
  final String title;
  final String images;
  final bool isActive;

  BuildButton(this.title, this.images, this.isActive);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {print('Button pressed');},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 19,),
          Container(
            child: SvgPicture.asset(
              images,
              color: isActive
                  ? Theme.of(context).selectedRowColor
                  : ltInactiveBlack,
            ),
          ),
          SizedBox(
            width: 9,
          ),
          Text(
            title,
            style: textSmall.copyWith(
                color: isActive
                    ? Theme.of(context).selectedRowColor
                    : ltInactiveBlack),
          ),
        ],
      ),
    );
  }
}
