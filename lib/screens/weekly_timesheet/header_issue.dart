import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/model/timesheet/submit_timesheet.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_excellence_hr/screens/navigate/navigation.dart';
import 'package:flutter_excellence_hr/services/timesheet/submit_weekly_report.dart';
import 'package:flutter_excellence_hr/services/timesheet/timesheet.dart';
import 'package:flutter_excellence_hr/widgets/appbar.dart';
import 'package:flutter_excellence_hr/widgets/timesheet_widgets/timesheet_widgets.dart';
import 'package:flutter_excellence_hr/model/timesheet/timesheet.dart';
import 'package:intl/intl.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class HeaderIssue extends StatefulWidget {
  @override
  _HeaderIssueState createState() => _HeaderIssueState();
}

class _HeaderIssueState extends State<HeaderIssue> {
  var varible;
  DateTime now = DateTime.now();
  double week;
  DateTime firstDayOfTheweek;
  String titleDate = "";
  String month = "";
  TimeSheetService api = TimeSheetService();
  TimeSheet timeSheet;
  SubmitTimeSheet submitWeeklyTimeSheet;
  bool enableContent = true;
  String note =
      """Are you sure want to submit as timesheet,cannot be changed once submit""";
  DateFormat formatter = DateFormat('yyyy-MM-dd');
  bool yourTimesheet = false;
  String formatted = "";
  bool totalTimeValidate = false;
  bool commentValidate = false;
  TimeSheetWeeklyService apiWeekly = TimeSheetWeeklyService();

  final RoundedLoadingButtonController _btnOkController =
      new RoundedLoadingButtonController();

  _getTimeSheet() async {
    week = now.day / 7 + 1;
    firstDayOfTheweek ??= now.subtract(new Duration(days: now.weekday - 1));
    formatted = formatter.format(firstDayOfTheweek);
    return await api.getTimesheet(fromDate: formatted).then((value) {
      timeSheet = value;
      setState(() {
        yourTimesheet = true;
      });
    });
  }

  void _submitWeeklyreport() async {
    week = now.day / 7 + 1;
    firstDayOfTheweek ??= now.subtract(new Duration(days: now.weekday - 1));
    String formatted = formatter.format(firstDayOfTheweek);
    return await apiWeekly.sentWeeklyTimesheet(date: formatted).then((value) {
      submitWeeklyTimeSheet = value;
      if (submitWeeklyTimeSheet.error == 1)
        _btnOkController.error();
      else {
        _btnOkController.success();
        setState(() {
          enableContent = false;
        });
      }
      Timer(Duration(seconds: 5), () {
        _btnOkController.reset();
        Navigator.of(context).pop();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getTimeSheet();
  }

  @override
  Widget build(BuildContext context) {
    week = now.day / 7 + 1;
    firstDayOfTheweek = now.subtract(new Duration(days: now.weekday - 1));
    switch (now.month.toString()) {
      case "1":
        {
          month = "(January)";
          break;
        }
      case "2":
        {
          month = "(February)";
          break;
        }
      case "3":
        {
          month = "(March)";
          break;
        }
      case "4":
        {
          month = "(April)";
          break;
        }
      case "5":
        {
          month = "(May)";
          break;
        }
      case "6":
        {
          month = "(June)";
          break;
        }
      case "7":
        {
          month = "(July)";
          break;
        }
      case "8":
        {
          month = "(August)";
          break;
        }
      case "9":
        {
          month = "(September)";
          break;
        }
      case "10":
        {
          month = "(October)";
          break;
        }
      case "11":
        {
          month = "(November)";
          break;
        }
      case "12":
        {
          month = "(December)";
          break;
        }
    }

    titleDate = " week " +
        week.toStringAsFixed(0) +
        " " +
        month +
        " " +
        now.year.toString();
    submitDialog() {
      return showDialog(
          context: context,
          builder: (BuildContext c) {
            return Dialog(
              child: Container(
                height: 250,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.all(16),
                        child: Text(note,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 25,
                                color: AppColors.LIGHTBLACK_COLOR))),
                    SizedBox(height: 10),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              width: 150,
                              color: Colors.grey,
                              child: FlatButton(
                                  height: 50,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Cancel",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white)))),
                          SizedBox(width: 15),
                          RoundedLoadingButton(
                              width: 150,
                              borderRadius: 5,
                              controller: _btnOkController,
                              onPressed: () {
                                _submitWeeklyreport();
                                _getTimeSheet();
                                setState(() {
                                  enableContent = false;
                                });
                              },
                              color: Colors.green[300],
                              child: Text('Add',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white))),
                        ])
                  ],
                ),
              ),
            );
          });
    }

    return Scaffold(
      backgroundColor: AppColors.BACKGROUND_COLOR,
      appBar: AppBar(title: AppBarWidget(pageName: "Weekly Timesheet")),
      drawer: Navigation(),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            submitDialog();
          },
          label: Text('Submit Weekly Timesheet'),
          backgroundColor: AppColors.BTN_BLACK_COLOR),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                color: AppColors.BLUE_COLOR,
                margin: EdgeInsets.all(8),
                child: ListTile(
                    leading: InkWell(
                        onTap: () {
                          now = now.subtract(Duration(days: 7));
                          firstDayOfTheweek =
                              now.subtract(new Duration(days: now.weekday - 1));
                          yourTimesheet = false;
                          _getTimeSheet();
                          setState(() {
                            titleDate = " week " +
                                week.toStringAsFixed(0) +
                                " " +
                                month +
                                " " +
                                now.year.toString();
                          });
                          enableContent = true;
                        },
                        child: Icon(Icons.arrow_left, color: Colors.white)),
                    title: Text(titleDate,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'OpenSans')),
                    trailing: InkWell(
                        onTap: () {
                          now = now.add(Duration(days: 7));
                          firstDayOfTheweek =
                              now.subtract(new Duration(days: now.weekday - 1));
                          yourTimesheet = false;
                          _getTimeSheet();

                          setState(() {
                            titleDate = " week " +
                                week.toStringAsFixed(0) +
                                " " +
                                month +
                                " " +
                                now.year.toString();
                          });
                          enableContent = true;
                        },
                        child: Icon(Icons.arrow_right, color: Colors.white)))),
            yourTimesheet
                ? enableContent
                    ? Content(
                        firstDayOfTheweek: firstDayOfTheweek,
                        timeSheet: timeSheet)
                    : AbsorbPointer(
                        child: Content(
                            firstDayOfTheweek: firstDayOfTheweek,
                            timeSheet: timeSheet))
                : Center(
                    child:
                        CircularProgressIndicator(backgroundColor: Colors.cyan))
          ],
        ),
      )),
    );
  }
}
