import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';


class HalfDay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      color: AppColors.HALF_DAY,
      child: Column(children: [
        Row(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Text(
                "0",
                style: TextStyle(
                    color: Colors.black,
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
                "HALF DAY",
                style: TextStyle(
                    color: Colors.black,
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