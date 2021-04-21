import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:places/ui/res/images.dart';
import 'package:places/ui/screen/sight_card.dart';
import 'package:places/ui/screen/sight_details.dart';
import 'package:places/widget/custom_app_bar.dart';

import '../../mocks.dart';
import 'add_sight_screen.dart';

class SightListScreen extends StatefulWidget {
  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(MediaQuery.of(context).padding.top),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: mocks
                  .map((sight) => Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(16),
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
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(bottom: 16),
              margin: EdgeInsets.only(
                  bottom: kBottomNavigationBarHeight +
                      MediaQuery.of(context).padding.bottom),
              child: ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 177, height: 48),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    padding: EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddSightScreen()));
                  },
                  child: Container(
                    width: 177,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color(0xFF4CAF50),
                          Color(0xFFFCDD3D),
                        ],
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Images.plusPng,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'НОВОЕ МЕСТО',
                          style: Theme.of(context).textTheme.button.copyWith(
                              color: Colors.white, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
