import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/text_style.dart';

class BuildButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isActive;

  BuildButton(this.title, this.icon, this.isActive);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Row(
        children: [
          Icon(
            icon,
            color: isActive ? Theme.of(context).selectedRowColor : ltInactiveBlack,
          ),
          SizedBox(
            width: 9,
          ),
          Text(
            title,
            style: textSmall.copyWith(
                color: isActive ? Theme.of(context).selectedRowColor  : ltInactiveBlack),
          ),
        ],
      ),
    );
  }
}


