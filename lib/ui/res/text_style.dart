import 'package:flutter/painting.dart';
import 'colors.dart';

TextStyle _text = const TextStyle(
  fontStyle: FontStyle.normal,
  fontSize: 32,
  color: textColorPrimary,
);
TextStyle textBold = _text.copyWith(fontWeight: FontWeight.w700, color: textColorPrimary),
    textBoldGreen = textBold.copyWith(color: colorGreen),
    textBoldYellow = textBold.copyWith(color: colorYellow);


