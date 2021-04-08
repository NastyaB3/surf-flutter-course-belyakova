import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'colors.dart';

TextStyle _text = const TextStyle(
  fontStyle: FontStyle.normal,
  fontSize: 32,
  color: textColorPrimary,
  fontFamily: 'Roboto',
);
TextStyle textBold = _text.copyWith(fontWeight: FontWeight.w700, color: textColorPrimary),
    textBoldWhite = _text.copyWith(fontWeight: FontWeight.w700, color: Colors.white,),
    textSmallBold = textBoldWhite.copyWith(fontSize: 14, fontWeight: FontWeight.w500),
    textBoldGreen = textBold.copyWith(color: colorGreen),
    textGreen = textBoldGreen.copyWith(fontSize: 14, fontWeight: FontWeight.w400),
    textBoldYellow = textBold.copyWith(color: colorYellow),
    textDescription = _text.copyWith(color: textColorDescription, fontSize: 14, fontWeight: FontWeight.normal),
    textTitle = _text.copyWith(color: textColorTitle, fontWeight: FontWeight.w500, fontSize: 16),
    textSubTitle= _text.copyWith(fontSize: 18, color: textColorSubTitle,),
    textSubTitleLight= _text.copyWith(fontSize: 18, color:lightGrey,fontWeight: FontWeight.w500, );




