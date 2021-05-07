import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/images.dart';

class SearchBar extends StatefulWidget implements PreferredSizeWidget {
  final Function onChange;
  final double statusBarHeight;

  SearchBar({this.onChange, this.statusBarHeight});

  @override
  _SearchBarState createState() => _SearchBarState();

  @override
  Size get preferredSize => Size.fromHeight(statusBarHeight + kToolbarHeight);
}

class _SearchBarState extends State<SearchBar> {
  final _controllerSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Список интересных мест',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          height: 40,
          child: TextField(
            onChanged: (text) {
              widget.onChange(text);
            },
            keyboardType: TextInputType.text,
            controller: _controllerSearch,
            cursorHeight: 24,
            cursorRadius: Radius.circular(1),
            cursorColor: Theme.of(context).selectedRowColor,
            decoration: InputDecoration(
              suffixIcon: InkWell(
                onTap: () {
                  _controllerSearch.clear();
                  widget.onChange('');
                },
                child: Container(
                  padding: EdgeInsets.only(top: 10, right: 10, bottom: 10),
                  child: SvgPicture.asset(
                    Images.icCloseRound,
                  ),
                ),
              ),
              hintText: 'Поиск',
              hintStyle: Theme.of(context).textTheme.subtitle1.copyWith(
                  color: ltInactiveBlack, fontWeight: FontWeight.w400),
              contentPadding: EdgeInsets.symmetric(vertical: 10.0),
              filled: true,
              fillColor: backColorLight,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(
                  width: 1,
                  color: backColorLight,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(
                  width: 1,
                  color: backColorLight,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(
                  width: 2,
                  color: backColorLight,
                ),
              ),
              prefixIcon: IconButton(
                onPressed: () {},
                icon: Container(
                  child: SvgPicture.asset(
                    Images.icSearch,
                    color: ltInactiveBlack,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
