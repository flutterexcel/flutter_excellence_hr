import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';


class Alert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      color: AppColors.NAVY_BLUE,
      child: Column(children: [
        Row(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Text(
                "*",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SourceSans',
                    fontSize: 16),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Text(
                "ALERT",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SourceSans',
                    fontSize: 14),
              ),
            ),
          ],
        )
      ]),
    ));
  }
}