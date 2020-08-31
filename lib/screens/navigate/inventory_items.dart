import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';


class InventoryItems extends StatelessWidget {
  String company, deviceType, uid;
  InventoryItems({this.company, this.deviceType, this.uid});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),       
      ),
      margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(
                      left: BorderSide(color: AppColors.DARK_GREY, width: 5)),
                ),
                padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                child: Text(
                  company,
                  style: TextStyle(fontSize: 20, color: AppColors.DARK_GREY),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                  decoration: BoxDecoration(
                      border: Border(
                          left: BorderSide(
                              color: AppColors.DARK_GREY, width: 5))),
                  padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                  child: Text(deviceType,
                      style:
                          TextStyle(fontSize: 20, color: AppColors.DARK_GREY))),
            ],
          ),
          Row(
            children: [
              Container(
                  decoration: BoxDecoration(
                      border: Border(
                          left: BorderSide(
                              color: AppColors.DARK_GREY, width: 5))),
                  padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
                  child: (Text(uid,
                      style: TextStyle(
                          fontSize: 20, color: AppColors.DARK_GREY)))),
            ],
          )
        ],
      ),
    );
  }
}