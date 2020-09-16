import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';

class WorkingDays extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      color: Colors.grey[200],
      child: Column(children: [
        Row(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Text(
                "24",
                style: TextStyle(
                    color: AppColors.THEME_COLOR,
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
                "WORKING DAYS",
                style: TextStyle(
                    color: AppColors.THEME_COLOR,
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
