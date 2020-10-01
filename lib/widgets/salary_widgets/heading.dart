import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';

class Heading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.grey[100],
          margin: EdgeInsets.only(left: 16, right: 16),
          child: Row(
            children: [
              Container(
                  margin: EdgeInsets.only(top: 16, left: 8,bottom: 16),
                  child: Text(
                    'SALARY ',
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'OpenSans',
                        color: AppColors.LIGHTBLACK_COLOR),
                  )),
              Container(
                  margin: EdgeInsets.only(top: 16,bottom: 16),
                  child: Text(
                    'DETAILS ',
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'SourceSans',
                        fontWeight: FontWeight.bold,
                        color: AppColors.LIGHTBLACK_COLOR),
                  )),
            ],
          ),
        ),
        SizedBox(height: 30),
        Container(
          color: Colors.grey[200],
          margin: EdgeInsets.only(left: 16, right: 16),
          child: Column(children: <Widget>[
            Row(
              children: [
                Container(
                    margin: EdgeInsets.only(top: 16, left: 8),
                    child: Text(
                      'Applicabel From: ',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'OpenSans',
                          color: AppColors.LIGHTBLACK_COLOR),
                    )),
                Container(
                    margin: EdgeInsets.only(top: 16),
                    child: Text(
                      '15-July-2020',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'SourceSans',
                          fontWeight: FontWeight.bold,
                          color: AppColors.LIGHTBLACK_COLOR),
                    )),
              ],
            ),
            Row(
              children: [
                Container(
                    margin: EdgeInsets.only(top: 8, left: 8),
                    child: Text(
                      'Applicabel Till: ',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'OpenSans',
                          color: AppColors.LIGHTBLACK_COLOR),
                    )),
                Container(
                    margin: EdgeInsets.only(top: 8),
                    child: Text(
                      '12 months (14-July-2021)',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'SourceSans',
                          fontWeight: FontWeight.bold,
                          color: AppColors.LIGHTBLACK_COLOR),
                    )),
              ],
            ),
            Row(
              children: [
                Container(
                    margin: EdgeInsets.only(top: 8, left: 8),
                    child: Text(
                      'Increment Amount: ',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'OpenSans',
                          color: AppColors.LIGHTBLACK_COLOR),
                    )),
                Container(
                    margin: EdgeInsets.only(top: 8),
                    child: Text(
                      '10000',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'SourceSans',
                          fontWeight: FontWeight.bold,
                          color: AppColors.LIGHTBLACK_COLOR),
                    )),
              ],
            ),
            Row(
              children: [
                Container(
                    margin: EdgeInsets.only(top: 8, left: 8),
                    child: Text(
                      'Leave Allocated: ',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'OpenSans',
                          color: AppColors.LIGHTBLACK_COLOR),
                    )),
                Container(
                    margin: EdgeInsets.only(top: 8),
                    child: Text(
                      '0.5',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'SourceSans',
                          fontWeight: FontWeight.bold,
                          color: AppColors.LIGHTBLACK_COLOR),
                    )),
              ],
            ),
            Row(
              children: [
                Container(
                    margin: EdgeInsets.only(top: 8, left: 8, bottom: 16),
                    child: Text(
                      'Updated On: ',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'OpenSans',
                          color: AppColors.LIGHTBLACK_COLOR),
                    )),
                Container(
                    margin: EdgeInsets.only(top: 8, bottom: 16),
                    child: Text(
                      '7th-September-2020',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'SourceSans',
                          fontWeight: FontWeight.bold,
                          color: AppColors.LIGHTBLACK_COLOR),
                    )),
              ],
            ),
          ]),
        )
      ],
    );
  }
}