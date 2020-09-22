import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';

class BotttomSecion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: AppColors.EDIT_TEXT_COLOR,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                    margin: EdgeInsets.all(16),
                    child: Text(
                      'MONTH',
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'SourceSans',
                          fontWeight: FontWeight.bold,
                          color: AppColors.LIGHTBLACK_COLOR),
                    )),
              ),
              Expanded(
                child: Container(
                    margin: EdgeInsets.all(16),
                    child: Text(
                      'TOTAL LEAVE TAKEN',
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'SourceSans',
                          fontWeight: FontWeight.bold,
                          color: AppColors.LIGHTBLACK_COLOR),
                    )),
              ),
              Expanded(
                child: Container(
                    margin: EdgeInsets.all(16),
                    child: Text(
                      'LEAVE BALANCE',
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'SourceSans',
                          fontWeight: FontWeight.bold,
                          color: AppColors.LIGHTBLACK_COLOR),
                    )),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 8),
          color: AppColors.EDIT_TEXT_COLOR,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                    margin: EdgeInsets.all(16),
                    child: Text(
                      'ALLOACTED LEAVES',
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'SourceSans',
                          fontWeight: FontWeight.bold,
                          color: AppColors.LIGHTBLACK_COLOR),
                    )),
              ),
              Expanded(
                child: Container(
                    margin: EdgeInsets.all(16),
                    child: Text(
                      'PAID LEAVES',
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'SourceSans',
                          fontWeight: FontWeight.bold,
                          color: AppColors.LIGHTBLACK_COLOR),
                    )),
              ),
              Expanded(
                child: Container(
                    margin: EdgeInsets.all(16),
                    child: Text(
                      'UNPAID LEAVES',
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'SourceSans',
                          fontWeight: FontWeight.bold,
                          color: AppColors.LIGHTBLACK_COLOR),
                    )),
              ),
            ],
          ),
        ),
        Container(
            margin: EdgeInsets.all(16),
            child: Text(
              'No Available Data',
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  color: AppColors.LIGHTBLACK_COLOR),
            )),
      ],
    );
  }
}
