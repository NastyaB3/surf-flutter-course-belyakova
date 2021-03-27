import 'package:flutter/material.dart';

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
            text: TextSpan(
                text: 'C',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
                children: [
                  TextSpan(
                      text: 'писок',
                      style: TextStyle(
                        color: Color(0xff3b3f59),
                      ),
                      children: [
                        TextSpan(
                            text: '\nи',
                            style: TextStyle(
                              color: Colors.yellow,
                            ),
                            children: [
                              TextSpan(
                                text: 'нтересных мест',
                                style: TextStyle(
                                  color: Color(0xff3b3f59),
                                ),
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
