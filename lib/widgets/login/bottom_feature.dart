import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';

class BottomFeature extends StatelessWidget {
  String text;
  BottomFeature({this.text});
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            child: Container(
                margin: EdgeInsets.fromLTRB(32, 0, 0, 16),
                child: Image.asset(
                  'assets/images/greenbtn.png',
                  width: 10,
                  height: 10,
                ))),
        Expanded(
          flex: 9,
          child: Container(
            margin: EdgeInsets.fromLTRB(8, 0, 32, 16),
            child: Text(text,
                style:
                    TextStyle(fontSize: 15, color: AppColors.LIGHTBLACK_COLOR)),
          ),
        ),
      ],
    );
  }
}
