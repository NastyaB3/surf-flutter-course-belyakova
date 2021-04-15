import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/ui/res/images.dart';

class CategoryIconButton extends StatefulWidget {
  final String icon;
  final String text;
  bool isSelected;
  final Function onClick;

  CategoryIconButton({
    Key key,
    this.icon,
    this.text,
    this.isSelected = false,
    this.onClick,
  }) : super(key: key);

  @override
  _CategoryIconButtonState createState() => _CategoryIconButtonState();
}

class _CategoryIconButtonState extends State<CategoryIconButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.isSelected = !widget.isSelected;
        });
        if (widget.onClick != null) {
          widget.onClick(widget.isSelected);
        }
      },
      child: Ink(
        child: Column(
          children: [
            Container(
              width: 84,
              height: 84,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      child: Center(
                        child: SvgPicture.asset(
                          widget.icon,
                          color: Theme.of(context).buttonColor,
                        ),
                      ),
                      width: 64,
                      height: 64,
                      margin: EdgeInsets.only(
                        top: 24,
                      ),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              Theme.of(context).buttonColor.withOpacity(0.16)),
                    ),
                  ),
                  widget.isSelected
                      ? Align(
                          alignment: Alignment.bottomRight,
                          child: SvgPicture.asset(Images.icTickChoice))
                      : Container(),
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              widget.text,
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      ),
    );
  }
}
