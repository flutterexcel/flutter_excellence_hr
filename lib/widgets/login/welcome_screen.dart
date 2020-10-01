import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_excellence_hr/resources/font_size.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(32, 0, 0, 0),
                child: Text('Welcome to',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: FontSize().eighteen,fontFamily: 'SourceSans',
                      color: AppColors.LIGHTBLACK_COLOR,
                    ))),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(32, 0, 8, 32),
                child: Text('Human Resource Management System',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,fontFamily: 'SourceSans',
                        color: AppColors.LIGHTBLACK_COLOR)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}