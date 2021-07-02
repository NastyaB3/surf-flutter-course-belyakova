import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/images.dart';
import 'package:places/ui/res/text_style.dart';
import 'package:places/widget/category.dart';
import 'package:places/widget/dialog_photo.dart';
import '../../mocks.dart';

class AddSightScreen extends StatefulWidget {
  @override
  _AddSightScreenState createState() => _AddSightScreenState();
}

class _AddSightScreenState extends State<AddSightScreen> {
  final _formKey = GlobalKey<FormState>();
  final _controllerName = TextEditingController();
  final _controllerLat = TextEditingController();
  final _controllerLon = TextEditingController();
  final _controllerDetails = TextEditingController();
  var isButtonEnable = false;
  FocusNode focusNodeName = FocusNode();
  FocusNode focusNodeLat = FocusNode();
  FocusNode focusNodeLon = FocusNode();
  FocusNode focusNodeDetails = FocusNode();
  SightType type;
  List<String> images = [];

  @override
  Widget build(BuildContext context) {
    final isButtonVisible = MediaQuery.of(context).viewInsets.bottom == 0;
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Новое место',
            style: Theme.of(context).textTheme.headline6,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.only(left: 16),
              child: Center(
                child: Text(
                  'Отмена',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          leadingWidth: 100,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 100.0,
                    child: ListView(
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      scrollDirection: Axis.horizontal,
                      children: [
                        Row(children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return DialogPhoto();
                                    });
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 16),
                              width: 72,
                              height: 72,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border:
                                    Border.all(color: backLineColor, width: 2),
                                color: Colors.transparent,
                              ),
                              child: Image.asset(
                                Images.plusPng,
                                color: Theme.of(context).buttonColor,
                              ),
                            ),
                          ),
                          for (var url in images)
                            Dismissible(
                              child: Container(
                                width: 72,
                                height: 72,
                                margin: EdgeInsets.only(right: 16),
                                child: Stack(
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(url),
                                                fit: BoxFit.cover),
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            images.remove(url);
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.only(
                                            top: 6,
                                            right: 6,
                                          ),
                                          child: SvgPicture.asset(
                                            Images.icSubtract,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              key: ValueKey(url),
                              direction: DismissDirection.vertical,
                              onDismissed: (DismissDirection direction) {
                                setState(() {
                                  images.remove(url);
                                });
                              },
                            ),
                        ]),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      top: 24,
                    ),
                    child: Text(
                      'КАТЕГОРИЯ',
                      style: textSuperSmall.copyWith(color: ltInactiveBlack),
                    ),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  InkWell(
                    onTap: () async {
                      var navigatorResult = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Category(type)));
                      if (navigatorResult != null &&
                          navigatorResult is SightType) {
                        setState(() {
                          type = navigatorResult;
                        });
                      }
                    },
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 16),
                              child: Text(
                                type != null ? changeType(type) : 'Не выбрано',
                                style: type != null
                                    ? Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        .copyWith(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontWeight: FontWeight.w400)
                                    : Theme.of(context).textTheme.bodyText2,
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 33.0),
                              child: Icon(Icons.chevron_right_outlined),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 14, right: 16, left: 16),
                          height: 0.8,
                          color: ltInactiveBlack,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      top: 24,
                    ),
                    child: Text(
                      'НАЗВАНИЕ',
                      style: textSuperSmall.copyWith(color: ltInactiveBlack),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 12, right: 16, left: 16),
                    child: ConstrainedBox(
                      constraints: BoxConstraints.tightFor(height: 40),
                      child: TextFormField(
                        autofocus: true,
                        focusNode: focusNodeName,
                        controller: _controllerName,
                        onFieldSubmitted: (String value) {
                          FocusScope.of(context).requestFocus(focusNodeLat);
                        },
                        onChanged: (text) {
                          validate();
                        },
                        showCursor: true,
                        cursorHeight: 24,
                        cursorRadius: Radius.circular(1),
                        cursorColor: Theme.of(context).primaryColor,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide:
                                BorderSide(width: 1, color: backLineColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(
                              width: 2,
                              color: backLineColor,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(
                              width: 1,
                              color: backLineColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 16,
                              top: 24,
                            ),
                            child: Text(
                              'ШИРОТА',
                              style: textSuperSmall.copyWith(
                                  color: ltInactiveBlack),
                            ),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(top: 12, right: 16, left: 16),
                            child: ConstrainedBox(
                              constraints: BoxConstraints.tightFor(
                                  height: 40, width: 156),
                              child: TextFormField(
                                autofocus: true,
                                focusNode: focusNodeLat,
                                controller: _controllerLat,
                                onChanged: (text) {
                                  validate();
                                },
                                onFieldSubmitted: (String value) {
                                  FocusScope.of(context)
                                      .requestFocus(focusNodeLon);
                                },
                                cursorRadius: Radius.circular(1),
                                showCursor: true,
                                cursorHeight: 24,
                                cursorColor: Theme.of(context).primaryColor,
                                keyboardType: TextInputType.numberWithOptions(
                                  signed: true,
                                ),
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'\d*\.?\d*'))
                                ],
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10.0),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    borderSide: BorderSide(
                                        width: 1, color: backLineColor),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    borderSide: BorderSide(
                                      width: 2,
                                      color: backLineColor,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: backLineColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 24, left: 16),
                            child: Text(
                              'ДОЛГОТА',
                              style: textSuperSmall.copyWith(
                                  color: ltInactiveBlack),
                            ),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(top: 12, right: 16, left: 16),
                            child: ConstrainedBox(
                              constraints: BoxConstraints.tightFor(
                                  height: 40, width: 156),
                              child: TextFormField(
                                autofocus: true,
                                controller: _controllerLon,
                                focusNode: focusNodeLon,
                                onFieldSubmitted: (String value) {
                                  FocusScope.of(context)
                                      .requestFocus(focusNodeDetails);
                                },
                                onChanged: (text) {
                                  validate();
                                },
                                cursorRadius: Radius.circular(1),
                                showCursor: true,
                                cursorHeight: 24,
                                cursorColor: Theme.of(context).primaryColor,
                                keyboardType: TextInputType.numberWithOptions(
                                  signed: true,
                                ),
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'\d*\.?\d*'))
                                ],
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10.0),
                                  suffixIcon: InkWell(
                                    onTap: () => _controllerLon.clear(),
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          top: 10, right: 10, bottom: 10),
                                      child: SvgPicture.asset(
                                        Images.icCloseRound,
                                      ),
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    borderSide: BorderSide(
                                        width: 1, color: backLineColor),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    borderSide: BorderSide(
                                      width: 2,
                                      color: backLineColor,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: backLineColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      top: 15,
                    ),
                    child: InkWell(
                      onTap: () {},
                      child: Text(
                        'Указать на карте',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(color: Theme.of(context).buttonColor),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 37, left: 16),
                    child: Text(
                      'ОПИСАНИЕ',
                      style: textSuperSmall.copyWith(color: ltInactiveBlack),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 12, right: 16, left: 16),
                    child: TextFormField(
                      autofocus: true,
                      controller: _controllerDetails,
                      focusNode: focusNodeDetails,
                      onChanged: (text) {
                        validate();
                      },
                      showCursor: true,
                      cursorHeight: 24,
                      minLines: 3,
                      maxLines: 9,
                      cursorRadius: Radius.circular(1),
                      cursorColor: Theme.of(context).primaryColor,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'введите текст',
                        contentPadding: EdgeInsets.all(10.0),
                        hintStyle: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(
                                color: ltInactiveBlack,
                                fontWeight: FontWeight.w400),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide:
                              BorderSide(width: 1, color: backLineColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(
                            width: 2,
                            color: backLineColor,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(
                            width: 1,
                            color: backLineColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: isButtonVisible
                  ? Container(
                      height: 48,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(
                        horizontal: 24,
                      ),
                      margin: EdgeInsets.only(
                          bottom: 20 + MediaQuery.of(context).padding.bottom),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            primary: isButtonEnable
                                ? Theme.of(context).buttonColor
                                : backColorLight,
                          ),
                          onPressed: () {
                            mocks.add(
                              Sight(
                                name: _controllerName.text,
                                lon: double.tryParse(_controllerLon.text),
                                lat: double.tryParse(_controllerLat.text),
                                photo: '',
                              ),
                            );
                          },
                          child: Text(
                            'СОЗДАТЬ',
                            style: isButtonEnable
                                ? Theme.of(context).textTheme.bodyText1
                                : Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(
                                        color: ltInactiveBlack,
                                        fontWeight: FontWeight.w700),
                          )),
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }

  void validate() {
    setState(() {
      isButtonEnable = _controllerLat.text.isNotEmpty &&
          _controllerName.text.isNotEmpty &&
          _controllerDetails.text.isNotEmpty &&
          _controllerLon.text.isNotEmpty &&
          type != null;
    });
  }

  String changeType(SightType type) {
    switch (type) {
      case SightType.hotel:
        return "Отель";
        break;
      case SightType.restaurant:
        return "Ресторан";
        break;
      case SightType.cafe:
        return "Кафе";
        break;
      case SightType.particularPlace:
        return "Особое место";
        break;
      case SightType.park:
        return "Парк";
        break;
      case SightType.museum:
        return "Музей";
        break;
      default:
        return "";
    }
  }
}
