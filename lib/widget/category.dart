import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/images.dart';

class Category extends StatefulWidget {
  SightType selected;
  Category(this.selected);
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  var categoryType = {
    SightType.cafe: 'Кафе',
    SightType.restaurant: 'Ресторан',
    SightType.hotel: 'Отель',
    SightType.museum: 'Музей',
    SightType.particularPlace: 'Особое место',
    SightType.park: 'Парк',
  };



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Категория',
          style: Theme.of(context).textTheme.headline6,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              for (final key in categoryType.keys.toList())
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          widget.selected = key;
                        });
                      },
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.only(left: 16, top: 14),
                                child: Text(
                                  categoryType[key],
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: 14, right: 16, left: 16),
                                height: 0.8,
                                color: ltInactiveBlack,
                              ),
                            ],
                          ),
                          widget.selected == key
                              ? Padding(
                            padding: EdgeInsets.only(right: 24, top: 12, bottom: 12),
                                child: Align(
                                    alignment: Alignment.centerRight,
                                    child: SvgPicture.asset(Images.icTick)),
                              )
                              : Container(),
                        ],
                      ),
                    ),
                  ],
                ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 48,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tightFor(height: 48),
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 48,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              margin: EdgeInsets.only(
                  bottom: 20 + MediaQuery.of(context).padding.bottom),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, widget.selected);
                },
                child: Text(
                  'СОХРАНИТЬ',
                  style: widget.selected != null
                      ? Theme.of(context).textTheme.bodyText1
                      : Theme.of(context).textTheme.bodyText1.copyWith(
                          color: ltInactiveBlack, fontWeight: FontWeight.w700),
                ),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  primary: widget.selected != null
                      ? Theme.of(context).buttonColor
                      : backColorLight,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
