import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/images.dart';
import 'package:places/ui/screen/filters_screen.dart';

import '../mocks.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double statusBarHeight;

  CustomAppBar(this.statusBarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Row(
        children: [
          Container(
            margin:
                EdgeInsets.only(top: statusBarHeight + 16, left: 16, right: 16),
            child: Text(
              'Список интересных мест',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FiltersScreen()));
            },
            icon: Container(
              child: SvgPicture.asset(
                Images.icFilter,
                color: ltColorGreen,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(statusBarHeight);
}
