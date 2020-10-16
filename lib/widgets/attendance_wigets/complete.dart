import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/model/attendance/month_attendance.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CompletePending extends StatelessWidget {
  final MonthSummary monthSummary;
  CompletePending({this.monthSummary});

  @override
  Widget build(BuildContext context) {
    double completePercent = (monthSummary.secondsCompletedWorkingHours) /
        (monthSummary.secondsActualWorkingHours);
    if (completePercent < 0) {
      completePercent = 0.0;
    }
    if (completePercent > 1) {
      completePercent = 0.9;
    }
    
    double pendingPercent = (monthSummary.secondsPendingWorkingHours) /
        (monthSummary.secondsActualWorkingHours);
    if (pendingPercent < 0) {
      pendingPercent = 0.0;
    }
    if (pendingPercent > 1) {
      pendingPercent = 0.9;
    }
    
    return Card(
      margin: EdgeInsets.fromLTRB(8, 16, 8, 16),
      child: Column(
        children: [
          Row(children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 16),
              child: Image(
                image: AssetImage('assets/images/greenicon.png'),
                width: 10,
                height: 10,
              ),
            ),
            Container(
                margin: EdgeInsets.fromLTRB(8, 16, 16, 16),
                child: Text(
                  "Completed",
                  style: TextStyle(
                      fontFamily: 'SourceSans', color: Colors.black45),
                )),
            Image(
              image: AssetImage('assets/images/pincicon.png'),
              width: 10,
              height: 10,
            ),
            Container(
                margin: EdgeInsets.fromLTRB(8, 16, 16, 16),
                child: Text(
                  "Pending",
                  style: TextStyle(
                      fontFamily: 'SourceSans', color: Colors.black45),
                )),
          ]),
          Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.fromLTRB(8, 16, 16, 16),
              child: LinearPercentIndicator(
                lineHeight: 8.0,
                percent: completePercent,
                progressColor: Colors.green,
              )),
          Row(
            children: [
              Container(
                  margin: EdgeInsets.all(8),
                  child: Text(
                    monthSummary.completedWorkingHours,
                    style: TextStyle(
                        color: Colors.black45, fontFamily: 'SourceSans'),
                  )),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.all(8),
                      child: Text(
                        monthSummary.pendingWorkingHours,
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
          )
        ],
      ),
    );
  }
}
