import 'package:flutter/material.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/text_style.dart';

final lightTheme = ThemeData(
  primaryColor: ltColorMain,
  backgroundColor: Colors.white,
  accentColor: backColorLight,
  scaffoldBackgroundColor: Colors.white,
  selectedRowColor: ltColorSecondary,
  buttonColor: ltColorGreen,
  buttonTheme: ButtonThemeData(
    buttonColor: ltColorGreen,
    textTheme: ButtonTextTheme.primary,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: backColorLight,
    selectedItemColor: ltColorMain,
    unselectedItemColor: ltColorSecondary,
  ),
  textTheme: TextTheme(
    headline4: textLarge.apply(color: ltColorMain),
    headline5: textTitle.apply(color: ltColorSecondary),
    headline6: textSubTitle.apply(color: ltColorMain),
    subtitle1: textText.apply(color: ltColorSecondary),
    bodyText1: textSmallBold.apply(color: Colors.white),
    bodyText2: textSmall.apply(color: ltColorSecondary2),
    caption: textSuperSmall.apply(color: ltColorSecondary),
    button: textButton.apply(color: ltColorGreen),
  ),
);

final darkTheme = ThemeData(
  primaryColor: Colors.white,
  accentColor: dtColorDark,
  backgroundColor: dtColorMain,
  scaffoldBackgroundColor: dtColorMain,
  selectedRowColor: Colors.white,
  buttonColor: dtColorGreen,
  buttonTheme: ButtonThemeData(
    buttonColor: dtColorGreen,
    textTheme: ButtonTextTheme.primary,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: dtColorMain,
    selectedItemColor: Colors.white,
    unselectedItemColor: backColorLight,
  ),
  textTheme: TextTheme(
    headline4: textLarge.apply(color: Colors.white),
    headline5: textTitle.apply(color: Colors.white),
    headline6: textSubTitle.apply(color: Colors.white),
    subtitle1: textText.apply(color: Colors.white),
    bodyText1: textSmallBold.apply(color: Colors.white),
    bodyText2: textSmall.apply(color: dtColorSecondary2),
    caption: textSuperSmall.apply(color: Colors.white),
    button: textButton.apply(color: dtColorGreen),
  ),
);
