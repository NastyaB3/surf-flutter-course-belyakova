import 'package:flutter/material.dart';
import 'package:places/ui/screen/sight_card.dart';
import 'package:places/ui/screen/sight_details.dart';
import 'package:places/widget/custom_app_bar.dart';

import '../../mocks.dart';

class SightListScreen extends StatefulWidget {
  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(MediaQuery.of(context).padding.top),
      body: SingleChildScrollView(
        child: Column(
          children: mocks
              .map((sight) => Container(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: GestureDetector(
                      child: AspectRatio(
                        aspectRatio: 3 / 2,
                        child: SightCard(sight),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SightDetails(sight),
                          ),
                        );
                      },
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}

