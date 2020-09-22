import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/model/attendance/month_attendance.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';

class DayRefrence extends StatelessWidget {
  final MonthAttendance monthAttendance;
  DayRefrence({this.monthAttendance});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            margin: EdgeInsets.fromLTRB(16, 24, 16, 16),
            width: MediaQuery.of(context).size.width,
            child: Text(
              "Day Reference",
              style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  color: AppColors.THEME_COLOR),
            )),
        Card(
            child: Container(
          color: Colors.grey[200],
          child: Column(children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Text(
                    monthAttendance.data.monthSummary.wORKINGDAY.toString(),
                    style: TextStyle(
                        color: AppColors.THEME_COLOR,
                        fontFamily: 'SourceSans',
                        fontSize: 16),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Text(
                    "WORKING DAYS",
                    style: TextStyle(
                        color: AppColors.THEME_COLOR,
                        fontFamily: 'SourceSans',
                        fontSize: 14),
                  ),
                ),
              ],
            )
          ]),
        )),
        Card(
            child: Container(
          color: Colors.yellowAccent,
          child: Column(children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Text(
                    monthAttendance.data.monthSummary.nONWORKINGDAY.toString(),
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'SourceSans',
                        fontSize: 16),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Text(
                    "NON WORKING DAYS",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'SourceSans',
                        fontSize: 14),
                  ),
                ),
              ],
            )
          ]),
        )),
        Card(
            child: Container(
          color: Colors.redAccent,
          child: Column(children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Text(
                    monthAttendance.data.monthSummary.lEAVEDAY.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'SourceSans',
                        fontSize: 16),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Text(
                    "LEAVE DAY",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'SourceSans',
                        fontSize: 14),
                  ),
                ),
              ],
            )
          ]),
        )),
        Card(
            child: Container(
          color: AppColors.HALF_DAY,
          child: Column(children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Text(
                    monthAttendance.data.monthSummary.hALFDAY.toString(),
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'SourceSans',
                        fontSize: 16),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Text(
                    "HALF DAY",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'SourceSans',
                        fontSize: 14),
                  ),
                ),
              ],
            )
          ]),
        )),
        Card(
            child: Container(
          color: AppColors.NAVY_BLUE,
          child: Column(children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Text(
                    monthAttendance.data.monthSummary.adminAlert,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'SourceSans',
                        fontSize: 16),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Text(
                    "ALERT",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'SourceSans',
                        fontSize: 14),
                  ),
                ),
              ],
            )
          ]),
        ))
      ],
    );
  }
}
