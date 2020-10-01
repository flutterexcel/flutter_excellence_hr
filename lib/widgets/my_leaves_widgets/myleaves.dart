import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';

class MyLeavesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children:<Widget> [
        Row(
          children: [
            Container(
                    margin: EdgeInsets.only(top: 16,left: 16,bottom: 16),
                    child: Text(
                      'MY LEAVES ',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'SourceSans',
                          fontWeight: FontWeight.bold,
                          color: AppColors.LIGHTBLACK_COLOR),
                    )),
          ],
        ),  
      Divider(height: 1,thickness: .5,color: Colors.grey[300]),
                Container(height:300),

      ],
    );
  }
}