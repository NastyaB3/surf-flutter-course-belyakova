import 'package:flutter/material.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/images.dart';
import 'package:places/ui/res/text_style.dart';
import 'package:places/widget/category_icon_button.dart';

import '../../mocks.dart';
import '../../search.dart';

class FiltersScreen extends StatefulWidget {
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  RangeValues _currentRangeValues;

  int counter = 0;

  var _filters = {
    SightType.cafe: true,
    SightType.hotel: true,
    SightType.museum: true,
    SightType.particularPlace: true,
    SightType.park: true,
    SightType.restaurant: true,
  };

  @override
  void initState() {
    _currentRangeValues = RangeValues(Search.positionFrom, Search.positionTo);
    _filters = Search.filters;
    counter = calculateDistance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                _filters.forEach((key, value) {
                  _filters[key] = false;
                });
              });
            },
            child: Container(
              padding: EdgeInsets.only(right: 16),
              child: Text(
                'Очистить',
                style: Theme.of(context)
                    .textTheme
                    .button
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 24, right: 276),
                child: Text(
                  'КАТЕГОРИИ',
                  style: textSmall.copyWith(color: ltInactiveBlack),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CategoryIconButton(
                    icon: Images.icHotel,
                    text: 'Отель',
                    isSelected: _filters[SightType.hotel],
                    onClick: (value) {
                      chooseFilter(SightType.hotel, value);
                    },
                  ),
                  CategoryIconButton(
                      icon: Images.icRestaurant,
                      text: 'Ресторан',
                      isSelected: _filters[SightType.restaurant],
                      onClick: (value) {
                        chooseFilter(SightType.restaurant, value);
                      }),
                  CategoryIconButton(
                      icon: Images.icParticularPlace,
                      text: 'Особое место',
                      isSelected: _filters[SightType.particularPlace],
                      onClick: (value) {
                        chooseFilter(SightType.particularPlace, value);
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CategoryIconButton(
                      icon: Images.icPark,
                      text: 'Парк',
                      isSelected: _filters[SightType.park],
                      onClick: (value) {
                        chooseFilter(SightType.park, value);
                      }),
                  CategoryIconButton(
                      icon: Images.icMuseum,
                      text: 'Музей',
                      isSelected: _filters[SightType.museum],
                      onClick: (value) {
                        chooseFilter(SightType.museum, value);
                      }),
                  CategoryIconButton(
                      icon: Images.icCafe,
                      text: 'Кафе',
                      isSelected: _filters[SightType.cafe],
                      onClick: (value) {
                        chooseFilter(SightType.cafe, value);
                      }),
                ],
              ),
              SizedBox(
                height: 60,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text('Расстояние',
                        style: textText.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).primaryColor)),
                  ),
                  Spacer(),
                  Text(
                    'от ${_currentRangeValues.start.round()} до ${_currentRangeValues.end.round()} м ',
                    textAlign: TextAlign.right,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                ],
              ),
              RangeSlider(
                  min: Search.defaultPositionFrom,
                  max: Search.defaultPositionTo,
                  activeColor: Theme.of(context).buttonColor,
                  inactiveColor: ltInactiveBlack,
                  values: _currentRangeValues,
                  onChanged: (RangeValues values) {
                    setState(() {
                      _currentRangeValues = values;
                      counter = calculateDistance();
                    });
                  }),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 48,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 24),
              margin: EdgeInsets.only(
                  bottom: 20 + MediaQuery.of(context).padding.bottom),
              child: ElevatedButton(
                onPressed: () {
                  Search.positionFrom = _currentRangeValues.start;
                  Search.positionTo = _currentRangeValues.end;
                  Search.filters = _filters;
                  Navigator.pop(context);
                },
                child: Text(
                  'ПОКАЗАТЬ ($counter)',
                  style: counter != 0
                      ? Theme.of(context).textTheme.bodyText1
                      : Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(color: ltInactiveBlack),
                ),
                style: counter != 0
                    ? ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        primary: Theme.of(context).buttonColor,
                      )
                    : ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        primary: backColorLight,
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void chooseFilter(SightType type, bool value) {
    _filters[type] = value;
    setState(() {
      counter = calculateDistance();
    });
  }

  int calculateDistance() {
    var nearsPlaces = Search.search(
      positionFrom: _currentRangeValues.start,
      positionTo: _currentRangeValues.end,
      filters: _filters,
    );
    return nearsPlaces.length;
  }
}
