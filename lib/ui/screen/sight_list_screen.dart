import 'package:flutter/material.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/text_style.dart';

class SightListScreen extends StatefulWidget {
  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.transparent,
        toolbarHeight: 120,
        elevation: 0,
        title: Container(
          child: RichText(
            maxLines: 2,
            text: TextSpan(text: 'C', style: textBoldGreen, children: [
              TextSpan(text: 'писок', style: textBold, children: [
                TextSpan(text: '\nи', style: textBoldYellow, children: [
                  TextSpan(
                    text: 'нтересных мест',
                    style: textBold,
                  ),
                ]),
              ]),
            ]),
          ),
        ),
      ),
      body: Center(
        child: Column(),
      ),
    );
  }
}
