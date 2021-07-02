import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/ui/res/images.dart';
import 'package:places/widget/icon_button_dialog.dart';

class DialogPhoto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButtonDialog(
                      text: 'Камера',
                      icon: Images.icCamera,
                    ),
                    Divider(),
                    IconButtonDialog(
                      text: 'Фотография',
                      icon: Images.icPhoto,
                    ),
                    Divider(),
                    IconButtonDialog(
                      text: 'Файл',
                      icon: Images.icFail,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(height: 48),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    primary: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0))),
                    child: Center(
                        child: Text(
                      "ОТМЕНА",
                      style: Theme.of(context).textTheme.button,
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
