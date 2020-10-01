import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';

class PersonDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
                margin: EdgeInsets.fromLTRB(32, 16, 0, 16),
              child: Text(
            '01 ',
            style: TextStyle(fontSize: 20, color: AppColors.GREEN_COLOR),
          )),
          Container(
            margin: EdgeInsets.fromLTRB(0, 16, 16,16),
              child: Text(
            "Personal Details",
            style: TextStyle(fontFamily: 'OpenSans', fontSize: 20,color:AppColors.BTN_BLACK_COLOR,)
          ))
        ],
      ),
    );
  }
}
