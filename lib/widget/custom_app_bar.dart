import 'package:flutter/material.dart';
import 'package:places/ui/res/text_style.dart';
import 'package:places/ui/screen/sight_card.dart';
import 'package:places/ui/screen/sight_details.dart';

import '../mocks.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double statusBarHeight;

  CustomAppBar(this.statusBarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 64, left: 16, right: 16),
      child: Text(
        'Список \nинтересных мест',
        maxLines: 2,
        style: textBold,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(statusBarHeight + 112 + 16);
}
