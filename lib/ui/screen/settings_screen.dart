import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/main.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/images.dart';
import 'package:places/ui/screen/res/themes.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> with ChangeNotifier {
  var isValue = false;
  var isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Container(
          child: Center(
            child: Text(
              'Настройки',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ),
      ),
      body: Column(children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                'Темная тема',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Switch.adaptive(
                value: isValue,
                onChanged: (currentValue) {
                  setState(() {
                    isValue = currentValue;
                  });

                  themeChanger.setDarkMode(currentValue);
                },
              ),
            ),
          ],
        ),
        SizedBox(
          height: 12,
        ),
        Container(
          height: 0.8,
          width: 350,
          color: lineColor,
        ),
        SizedBox(
          height: 14,
        ),
        Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                'Смотреть туториал',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 26.0),
              child: SvgPicture.asset(Images.icInformation),
            ),
          ],
        ),
        SizedBox(
          height: 14,
        ),
        Container(
          height: 0.8,
          width: 350,
          color: lineColor,
        ),
      ]),
    );
  }
}
