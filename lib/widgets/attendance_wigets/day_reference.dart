import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';

class DayRefrence extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(16, 24, 16, 16),
                child: Text(
                  "Day Reference",
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 20,
                      color: AppColors.THEME_COLOR),
                )),
          ],
        ),
        
      ],
    );
  }
}