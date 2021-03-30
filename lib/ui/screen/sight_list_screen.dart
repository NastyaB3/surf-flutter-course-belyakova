import 'package:flutter/material.dart';
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
          child: Text(
            'Список \nинтересных мест',
            maxLines: 2,
            style: textBold,
          ),
        ),
      ),
      body: Center(
        child: Column(),
      ),
    );
  }
}
