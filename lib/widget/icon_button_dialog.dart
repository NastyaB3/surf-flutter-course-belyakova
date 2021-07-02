import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconButtonDialog extends StatefulWidget {
  final String icon;
  final String text;

  const IconButtonDialog({Key key, this.icon, this.text}) : super(key: key);

  @override
  _IconButtonDialogState createState() => _IconButtonDialogState();
}

class _IconButtonDialogState extends State<IconButtonDialog> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
      height: 48,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 16,
          ),
          SvgPicture.asset(widget.icon),
          SizedBox(
            width: 12,
          ),
          Text(
            widget.text,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ],
      ),
    ));
  }
}
