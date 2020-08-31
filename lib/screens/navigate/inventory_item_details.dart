import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';

class InventoryItemDetails extends StatelessWidget {
  String text1,text2;
  InventoryItemDetails({this.text1,this.text2});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Container(
                  padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                  child: (Text(text1,
                      style: TextStyle(
                          fontSize: 20, color: AppColors.LIGHTBLACK_COLOR)))),
            ],
          ),
          Row(
            children: [
              Container(
                  padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                  child: Text(text2,
                      style:
                          TextStyle(fontSize: 20, color: AppColors.DARK_GREY))),
            ],
          ),
        ],
      ),
    );
  }
}
