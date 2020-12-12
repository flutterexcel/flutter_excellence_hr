import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.BLUE_COLOR,
        margin: EdgeInsets.all(8),
        child: ListTile(
          leading: Icon(
            Icons.arrow_left,
            color: Colors.white,
          ),
          title: Text(
            'WEEK 4 (SEPTEMBER)',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontFamily: 'OpenSans'),
          ),
          trailing: Icon(
            Icons.arrow_right,
            color: Colors.white,
          ),
        ));
  }
}