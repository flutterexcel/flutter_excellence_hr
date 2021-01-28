import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_excellence_hr/model/timesheet/submit_daily_report.dart';
import 'package:flutter_excellence_hr/model/timesheet/timesheet.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_excellence_hr/services/timesheet/submit_timesheet_daily.dart';
import 'package:flutter_excellence_hr/services/timesheet/timesheet.dart';
import 'package:flutter_excellence_hr/widgets/timesheet_widgets/upoad_tracker.dart';
import 'package:intl/intl.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class Content extends StatefulWidget {
  DateTime firstDayOfTheweek;
  TimeSheet timeSheet;
  Content({this.firstDayOfTheweek, this.timeSheet});
  @override
  _ContentState createState() => _ContentState(firstDayOfTheweek);
}

class _ContentState extends State<Content> {
  final totalTime = TextEditingController();
  final comment = TextEditingController();
  DateFormat formatter = DateFormat('yyyy-MM-dd');
  DateTime firstDayOfTheweek;
  TimeSheetService api = TimeSheetService();
  TimeSheet timeSheet;
  TimeSheetDailyService apidaily = TimeSheetDailyService();
  SubmitDailyReport submitDailyReport;
  bool yourTimesheet = false;
  bool dailyReport = false;
  String formatted = "";
  bool totalTimeValidate = false;
  bool commentValidate = false;
  DateTime now = DateTime.now();
  double week;
  RoundedLoadingButtonController _btnController =
      new RoundedLoadingButtonController();
  _ContentState(this.firstDayOfTheweek);

  _getTimeSheet() async {
    String formatted = formatter.format(firstDayOfTheweek);
    return await api.getTimesheet(fromDate: formatted).then((value) {
      timeSheet = value;
      setState(() {
        yourTimesheet = true;
      });
    });
  }

  void _getDailyreport({String fullDate}) async {
    return await apidaily
        .getDailyTimesheet(
            totalHour: totalTime.text, comment: comment.text, date: fullDate)
        .then((value) {
      submitDailyReport = value;
      _btnController.success();
      _doReset();
      setState(() {
        dailyReport = true;
      });
    });
  }

  void _doReset() async {
    Timer(Duration(seconds: 2), () {
      _btnController.reset();
      Navigator.pop(context);
    });
  }

  bool validateCommentField(String commentEntry) {
    if (commentEntry.isEmpty) {
      setState(() {
        commentValidate = true;
      });
      return false;
    }
    setState(() {
      commentValidate = false;
    });
    return true;
  }

  bool validatetimeField(String timeEbtry) {
    if (timeEbtry.isEmpty) {
      setState(() {
        totalTimeValidate = true;
      });
      return false;
    }
    setState(() {
      totalTimeValidate = false;
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    customDialog({String day, String date}) {
      return showDialog(
          context: context,
          builder: (BuildContext c) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: Container(
                height: 450,
                width: MediaQuery.of(context).size.width,
                decoration:
                    new BoxDecoration(borderRadius: BorderRadius.circular(5)),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                margin: EdgeInsets.all(16),
                                child: Text(day + " Time Sheet",
                                    style: TextStyle(
                                        fontSize: 18, fontFamily: 'OpenSans'))),
                            InkWell(
                              onTap: () => Navigator.of(context).pop(),
                              child: Container(
                                  margin: EdgeInsets.only(right: 8),
                                  child: Icon(Icons.clear)),
                            )
                          ]),
                      Divider(height: 1, thickness: .5, color: Colors.grey),
                      SizedBox(height: 16),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Container(
                                    margin: EdgeInsets.only(left: 16),
                                    child: Text("Total Time ",
                                        style: TextStyle(
                                            fontFamily: 'OpenSans',
                                            fontSize: 16))))
                          ]),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Container(
                                    margin: EdgeInsets.fromLTRB(16, 8, 16, 16),
                                    child: TextFormField(
                                        key: Key('totalTimeKey'),
                                        enabled: true,
                                        controller: totalTime,
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'[0-9.]'))
                                        ],
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: "",
                                            errorText: totalTimeValidate
                                                ? "Time can't be empty"
                                                : null,
                                            labelStyle: TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'OpenSans',
                                                fontSize: 16)))))
                          ]),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                                margin: EdgeInsets.only(left: 16),
                                child: Text("Comment ",
                                    style: TextStyle(
                                        fontFamily: 'OpenSans', fontSize: 16))),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                              child: TextFormField(
                                key: Key('commentKey'),
                                enabled: true,
                                maxLines: 5,
                                controller: comment,
                                decoration: InputDecoration(
                                  labelText: "",
                                  errorText: commentValidate
                                      ? "comments can't empty"
                                      : null,
                                  border: OutlineInputBorder(),
                                  // hintText: tmsReport.data.report,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                                margin: EdgeInsets.fromLTRB(16, 8, 16, 16),
                                height: 45,
                                child: Text(
                                  'Its better if you put your detail reports on tms and HR system will automatically fetch it for you',
                                  style: TextStyle(
                                      color: AppColors.LIGHTBLACK_COLOR,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                                margin: EdgeInsets.only(left: 16),
                                child: Text("Upload Tracker Screenshot",
                                    style: TextStyle(
                                        fontFamily: 'OpenSans', fontSize: 16))),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
                              child: UploadTracker(),
                            ),
                          ),
                        ],
                      ),
                      RoundedLoadingButton(
                        controller: _btnController,
                        color: AppColors.BTN_BLACK_COLOR,
                        width: 150,
                        borderRadius: 10,
                        onPressed: () {
                          if (!validateCommentField(comment.text)) {
                            _btnController.stop();
                          } else if (!validatetimeField(totalTime.text))
                            _btnController.stop();
                          else {
                            dailyReport = false;
                            _getDailyreport(fullDate: date);
                            setState(() {
                              _getTimeSheet();
                            });
                            Timer(Duration(seconds: 5), () {
                              totalTime.text = "";
                              comment.text = "";
                            });
                          }
                        },
                        child: Text('Submit',
                            style: TextStyle(color: Colors.white)),
                      ),
                      SizedBox(height: 30)
                    ],
                  ),
                ),
              ),
            );
          });
    }

    return Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: widget.timeSheet.data.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * .25,
                    child: Text(
                      dailyReport
                          ? timeSheet.data[index].day
                          : widget.timeSheet.data[index].day,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'SourceSans',
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    )),
                (widget.timeSheet.data[index].dayType == "NON_WORKING_DAY")
                    ? Container(
                        color: Colors.yellowAccent,
                        width: MediaQuery.of(context).size.width * .25,
                        margin: EdgeInsets.fromLTRB(0, 1, 0, 1),
                        padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                        child: Text(
                            dailyReport
                                ? timeSheet.data[index].date
                                : widget.timeSheet.data[index].date,
                            style: TextStyle(
                                fontFamily: 'OpenSans', fontSize: 14)))
                    : InkWell(
                        onTap: () {
                          customDialog(
                              day: widget.timeSheet.data[index].day.toString(),
                              date: widget.timeSheet.data[index].fullDate);
                        },
                        child: Container(
                            color: Colors.grey[300],
                            width: MediaQuery.of(context).size.width * .25,
                            margin: EdgeInsets.fromLTRB(0, 1, 0, 1),
                            padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                            child: Text(
                                dailyReport
                                    ? timeSheet.data[index].date
                                    : widget.timeSheet.data[index].date,
                                style: TextStyle(
                                    fontFamily: 'OpenSans', fontSize: 14))),
                      ),
                (widget.timeSheet.data[index].dayType == "NON_WORKING_DAY")
                    ? Container(
                        color: Colors.yellowAccent,
                        width: MediaQuery.of(context).size.width * .25,
                        padding: EdgeInsets.fromLTRB(8, 0, 0, 8),
                        child: Text(
                            dailyReport
                                ? timeSheet.data[index].dayText
                                : widget.timeSheet.data[index].dayText,
                            style: TextStyle(
                                fontFamily: 'OpenSans', fontSize: 14)))
                    : InkWell(
                        onTap: () {
                          customDialog(
                              day: widget.timeSheet.data[index].day.toString(),
                              date: widget.timeSheet.data[index].fullDate);
                        },
                        child: Container(
                            color: Colors.grey[300],
                            width: MediaQuery.of(context).size.width * .25,
                            padding: EdgeInsets.fromLTRB(8, 0, 0, 8),
                            child: Text(
                                dailyReport
                                    ? timeSheet.data[index].totalHours
                                            .toString() +
                                        " - Hours"
                                    : widget.timeSheet.data[index].totalHours
                                            .toString() +
                                        " - Hours",
                                style: TextStyle(
                                    fontFamily: 'OpenSans', fontSize: 14))),
                      ),
              ],
            );
          },
        ));
  }
}
