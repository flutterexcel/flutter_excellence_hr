import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';

class Header extends StatelessWidget {
  DateTime now = DateTime.now();
  double week;
  DateTime next = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.BLUE_COLOR,
        margin: EdgeInsets.all(8),
        child: ListTile(
          leading: InkWell(
            onTap: () {},
            child: Icon(
              Icons.arrow_left,
              color: Colors.white,
            ),
          ),
          title: InkWell(
            onTap: () {
              week = now.day / 7 + 1;
              next = next.add(Duration(days: 1));
              print(" the next day is  " +
                  next.day.toString() +
                  "Weekday is " +
                  next.weekday.toString());
              print("The day is " +
                  now.day.toString() +
                  "month is  " +
                  now.month.toString());
              print(now.month);
              print("The week is " + week.toStringAsFixed(0));
            },
            child: Text(
              'WEEK 2 (DECEMBER)',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontFamily: 'OpenSans'),
            ),
          ),
          trailing: Icon(
            Icons.arrow_right,
            color: Colors.white,
          ),
        ));
  }
}
