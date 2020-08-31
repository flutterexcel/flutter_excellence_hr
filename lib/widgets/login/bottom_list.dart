import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';

class BottomList extends StatelessWidget {
    String text;
    BottomList({this.text});
  @override
  Widget build(BuildContext context) {
    return  Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(32, 16, 16, 8),
                child: Text(text,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: AppColors.BTN_BLACK_COLOR)),
              ),
            ),
          ],
        );
       
  }
}