import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

TextStyle textLarge = const TextStyle(
  fontSize: 32,
  fontWeight: FontWeight.bold,
  fontStyle: FontStyle.normal,
  fontFamily: 'Roboto',
);  //headline4
TextStyle textTitle = textLarge.copyWith(fontSize: 24), //headline5
          textSubTitle = textLarge.copyWith(fontWeight: FontWeight.w500, fontSize: 18), //headline6
          textText = textSubTitle.copyWith(fontSize: 16), //subtitle1
          textSmallBold = textLarge.copyWith(fontSize: 14), //body1
          textSmall = textSmallBold.copyWith(fontWeight: FontWeight.normal), //body2
          textSuperSmall = textSmall.copyWith(fontSize: 12),               //caption
          textButton = textSmallBold.copyWith(letterSpacing: 0.03,),
          textSmallWhite = textSmall.copyWith(color: Colors.white);








