import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/model/timesheet/submit_daily_report.dart';
import 'package:flutter_excellence_hr/model/timesheet/timesheet.dart';
import 'package:flutter_excellence_hr/model/timesheet/timesheetupdated.dart';
import 'package:flutter_excellence_hr/model/tmsreport/tmsreport.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_excellence_hr/screens/navigate/navigation.dart';
import 'package:flutter_excellence_hr/services/timesheet/submit_timesheet_daily.dart';
import 'package:flutter_excellence_hr/services/timesheet/timesheet.dart';
import 'package:flutter_excellence_hr/services/timesheet/updatetimesheet.dart';
import 'package:flutter_excellence_hr/services/tmsreport/tmsreport.dart';
import 'package:flutter_excellence_hr/widgets/appbar.dart';
import 'package:flutter_excellence_hr/widgets/timesheet_widgets/timesheet_widgets.dart';
import 'package:flutter_excellence_hr/widgets/timesheet_widgets/upoad_tracker.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:sticky_headers/sticky_headers.dart';

class TimeSheetUI extends StatefulWidget {
  DateTime firstDayOfTheweek;
  TimeSheetUI({this.firstDayOfTheweek});
  @override
  _WeeklyTimeSheetState createState() =>
      _WeeklyTimeSheetState(firstDayOfTheweek);
}

class _WeeklyTimeSheetState extends State<TimeSheetUI> {
  final totalTime = TextEditingController();
  final comment = TextEditingController();
  TMSReportService apireport = TMSReportService();
  TMSReport tmsReport;

  TimeSheetService api = TimeSheetService();
  TimeSheet timeSheet;
  TimeSheetDailyService apidaily = TimeSheetDailyService();

  SubmitDailyReport submitDailyReport;
  TimeSheetUpdateService apiUpdateTimeSheet = TimeSheetUpdateService();
  TimeSheetUpdated timeSheetUpdated;
  final RoundedLoadingButtonController _btnController =
      new RoundedLoadingButtonController();
  bool yourTimesheet = false;
  bool yourTMSReport = false;
  bool yourDailyReport = false;
  DateTime now = DateTime.now();
  DateTime firstDayOfTheweek;
  _WeeklyTimeSheetState(this.firstDayOfTheweek);

  _getTimeSheet() async {
    return await api.getTimesheet().then((value) {
      timeSheet = value;
      print("The full time date " + timeSheet.data[0].fullDate);
      print("the data text is: " + timeSheet.data[6].dayType);
      // print("The status is  " + timeSheet.data[0].status);
      // print("The comments are " + timeSheet.data[0].comments);
      // print("Total time " + timeSheet.data[0].totalHours.toString());
      setState(() {
        yourTimesheet = true;
      });
    });
  }

  void _getDailyreport() async {
    return await apidaily
        .getDailyTimesheet(totalHour: totalTime.text, comment: comment.text)
        .then((value) {
      submitDailyReport = value;
      print(">>>>>>>>>>>>>>>>" + submitDailyReport.toString());
      _btnController.success();
      setState(() {
        yourDailyReport = true;
      });
      _doReset();
    });
  }

  _getTMSReport() async {
    return await apireport.getTMSComment().then((value) {
      tmsReport = value;
      setState(() {
        yourTMSReport = true;
      });
    });
  }

  _getUpdatedTimesheet() async {
    return await apiUpdateTimeSheet.getDailyTimesheetUpdated().then((value) {
      timeSheetUpdated = value;
    });
  }

  void _doReset() async {
    Timer(Duration(seconds: 2), () {
      _btnController.reset();
    });
  }

  @override
  void initState() {
    super.initState();
    _getTimeSheet();
    _getTMSReport();
    //_getDailyreport();
  }

  @override
  Widget build(BuildContext context) {
    //   firstDayOfTheweek = now.subtract(new Duration(days: now.weekday - 1));
    // print("First Week in timesheet screen>>>>>>> " +
    //     firstDayOfTheweek.toString());
    customDialog() {
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
                                child: Text("Monday Time Sheet",
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
                                    height: 35,
                                    child: TextFormField(
                                        enabled: true,
                                        controller: totalTime,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: "",
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
                              height: 100,
                              child: TextFormField(
                                enabled: true,
                                maxLines: 5,
                                controller: comment,
                                decoration: InputDecoration(
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
                          _getDailyreport();
                          Timer(Duration(seconds: 5), () {
                            Navigator.pop(context);
                            totalTime.text = "";
                            comment.text = "";
                          });
                          _getTimeSheet();
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

    return yourTimesheet
        ? Scaffold(
            backgroundColor: AppColors.BACKGROUND_COLOR,
            appBar: AppBar(title: AppBarWidget(pageName: "Weekly Timesheet")),
            drawer: Navigation(),
            floatingActionButton: FloatingActionButton.extended(
                onPressed: () {
                  // Add your onPressed code here!
                },
                label: Text('Submit Weekly Timesheet'),
                backgroundColor: AppColors.BTN_BLACK_COLOR),
            body: SafeArea(
                child: SingleChildScrollView(
              child: StickyHeader(
                header: Header(),
                content: Container(
                    height: MediaQuery.of(context).size.height,
                    padding: EdgeInsets.all(16.0),
                    child: GridView.builder(
                      itemCount: timeSheet.data.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 4.0,
                          mainAxisSpacing: 4.0),
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width * .25,
                                //  margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
                                child: Text(
                                  timeSheet.data[index].day,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'SourceSans',
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                )),
                            (timeSheet.data[index].dayType == "NON_WORKING_DAY")
                                ? Container(
                                    color: Colors.yellowAccent,
                                    width:
                                        MediaQuery.of(context).size.width * .25,
                                    margin: EdgeInsets.fromLTRB(0, 1, 0, 1),
                                    padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                                    child: Text(timeSheet.data[index].date,
                                        style: TextStyle(
                                            fontFamily: 'OpenSans',
                                            fontSize: 14)))
                                : InkWell(
                                    onTap: () {
                                      customDialog();
                                    },
                                    child: Container(
                                        color: Colors.grey[300],
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .25,
                                        margin: EdgeInsets.fromLTRB(0, 1, 0, 1),
                                        padding:
                                            EdgeInsets.fromLTRB(8, 8, 8, 8),
                                        child: Text(timeSheet.data[index].date,
                                            style: TextStyle(
                                                fontFamily: 'OpenSans',
                                                fontSize: 14))),
                                  ),
                            (timeSheet.data[index].dayType == "NON_WORKING_DAY")
                                ? Container(
                                    color: Colors.yellowAccent,
                                    width:
                                        MediaQuery.of(context).size.width * .25,
                                    //  margin: EdgeInsets.fromLTRB(8, 0, 1, 8),
                                    padding: EdgeInsets.fromLTRB(8, 0, 0, 8),
                                    child: Text(timeSheet.data[index].dayText,
                                        style: TextStyle(
                                            fontFamily: 'OpenSans',
                                            fontSize: 14)))
                                : InkWell(
                                    onTap: () {
                                      customDialog();
                                    },
                                    child: Container(
                                        color: Colors.grey[300],
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .25,
                                        //  margin: EdgeInsets.fromLTRB(8, 0, 1, 8),
                                        padding:
                                            EdgeInsets.fromLTRB(8, 0, 0, 8),
                                        child: Text(
                                            timeSheet.data[index].totalHours
                                                    .toString() +
                                                " - Hours",
                                            style: TextStyle(
                                                fontFamily: 'OpenSans',
                                                fontSize: 14))),
                                  ),
                          ],
                        );
                      },
                    )),
              ),
            )),
          )
        : Scaffold(
            body: Center(
                child:
                    CircularProgressIndicator(backgroundColor: Colors.cyan)));
  }
}