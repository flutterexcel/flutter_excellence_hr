import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_excellence_hr/resources/font_size.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../model/attendance/month_attendance.dart';

class TimeCompensate extends StatelessWidget {
  final MonthAttendance monthAttendance;
  bool showCompensate = false;
  TimeCompensate({this.monthAttendance});
  @override
  Widget build(BuildContext context) {
    double pendingPercent =
        (monthAttendance.data.compensationSummary.secondsToBeCompensate /
            monthAttendance.data.monthSummary.secondsActualWorkingHours);
    if (pendingPercent < 0) {
      pendingPercent = 0.0;
    }
    
    if (pendingPercent > 1) {
      pendingPercent = 0.9;
    }

    if (monthAttendance.data.compensationSummary.secondsToBeCompensate >= 1) {
      showCompensate = true;
    }

    customDialog() {
      return showDialog(
          context: context,
          builder: (BuildContext c) {
            return Dialog(
              child: Container(
                height: 250,
                width: MediaQuery.of(context).size.width,
                child: Column(children: <Widget>[
                  Row(
                    children: [
                      Container(
                          margin: EdgeInsets.fromLTRB(16, 24, 16, 0),
                          child: Text(
                            "Time Comapnsation Summary",
                            style: TextStyle(
                                color: AppColors.THEME_COLOR,
                                fontSize: 20,
                                fontFamily: 'OpenSans'),
                          )),
                    ],
                  ),
                  showCompensate
                      ? Container(
                          margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
                          child: SingleChildScrollView(
                              child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            // Let the ListView know how many items it needs to build.
                            itemCount: monthAttendance.data.compensationSummary
                                .compensationBreakUp.length,
                            // Provide a builder function. This is where the magic happens.
                            // Convert each item into a widget based on the type of item it is.
                            itemBuilder: (context, index) {
                              final item = monthAttendance
                                  .data
                                  .compensationSummary
                                  .compensationBreakUp[index];

                              return ListTile(
                                title: Text(item.text,
                                    style: TextStyle(fontSize: 12)),
                                dense: true,
                              );
                            },
                          )))
                      : Container(
                          margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
                          child: Text(
                            'Nothing To Compensate',
                            style: TextStyle(
                                color: AppColors.THEME_COLOR,
                                fontSize: 16,
                                fontFamily: 'OpenSans'),
                          ))
                ]),
              ),
            );
          });
    }

    return Card(
      child: Column(children: <Widget>[
        Row(
          children: [
            Container(
                margin: EdgeInsets.all(8),
                child: Text(
                  "Time to Compansate",
                  style: TextStyle(
                      color: Colors.black45, fontFamily: 'SourceSans'),
                )),
            Expanded(
                child: Container(
                    margin: EdgeInsets.all(8),
                    child: Text(
                      (pendingPercent * 100).toStringAsFixed(2) + '%',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          color: Colors.black45, fontFamily: 'SourceSans'),
                    )))
          ],
        ),
        Container(
          margin: EdgeInsets.fromLTRB(8, 16, 16, 16),
          width: MediaQuery.of(context).size.width,
          child: LinearPercentIndicator(
            lineHeight: 8.0,
            percent: pendingPercent,
            progressColor: Colors.redAccent,
          ),
        ),
        Row(
          children: [
            Container(
                margin: EdgeInsets.only(left: 8),
                child: InkWell(
                  onTap: () {
                    customDialog();
                  },
                  child: Icon(
                    Icons.info_outline_rounded,
                    color: AppColors.LIGHT_YELLOW,
                  ),
                )),
          ],
        ),
        Row(
          children: [
            Container(
                margin: EdgeInsets.all(8),
                child: Text(
                  "Total Working",
                  style: TextStyle(
                      color: Colors.black45, fontFamily: 'SourceSans'),
                )),
            Expanded(
                child: Container(
                    margin: EdgeInsets.all(8),
                    child: Text(
                      monthAttendance
                          .data.compensationSummary.timeToBeCompensate,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          color: Colors.black45, fontFamily: 'SourceSans'),
                    )))
          ],
        ),
      ]),
    );
  }
}
