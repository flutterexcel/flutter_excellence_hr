import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';


class ImportantNotesInventory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children:<Widget> [
              Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(16, 32, 16, 0),
                          padding: EdgeInsets.fromLTRB(16, 32, 16, 0),
                          width: MediaQuery.of(context).size.width,
                          color: AppColors.PINK_COLOR,
                          child: Text(
                            'Important:',
                            style: TextStyle(
                                fontSize: 30,
                                color: AppColors.RED_COLOR,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                          padding: EdgeInsets.fromLTRB(16, 16, 0, 8),
                          width: MediaQuery.of(context).size.width,
                          color: AppColors.PINK_COLOR,
                          child: Text(
                            '- Your monthly audit of inventories is pending',
                            style: TextStyle(
                                fontSize: 25, color: AppColors.RED_COLOR),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                          padding: EdgeInsets.fromLTRB(16, 0, 0, 8),
                          width: MediaQuery.of(context).size.width,
                          color: AppColors.PINK_COLOR,
                          child: Text(
                            '- Select your audit report from the drop down for each of your inventory item',
                            style: TextStyle(
                                fontSize: 25, color: AppColors.RED_COLOR),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                          padding: EdgeInsets.fromLTRB(16, 0, 0, 32),
                          width: MediaQuery.of(context).size.width,
                          color: AppColors.PINK_COLOR,
                          child: Text(
                            '- Once you are done with all the inventories you will be able to access rest of HR app',
                            style: TextStyle(
                                fontSize: 25, color: AppColors.RED_COLOR),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
          
      ],
    );
  }
}