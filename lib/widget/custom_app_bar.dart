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
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(top: 64, left: 16, right: 16),
          child: Text(
            'Список \nинтересных мест',
            maxLines: 2,
            style: Theme.of(context).textTheme.headline4,
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
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(statusBarHeight + 112 + 16);
}
