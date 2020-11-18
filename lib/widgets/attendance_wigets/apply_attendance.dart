import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/model/attendance/month_attendance.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_excellence_hr/services/attendance/manual_entry.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class ApplyAttendance extends StatefulWidget {
  MonthAttendance monthAttendance;
  int index;
  ApplyAttendance({this.monthAttendance, this.index});
  @override
  _ApplyAttendanceState createState() =>
      _ApplyAttendanceState(monthAttendance: monthAttendance, index: index);
}

class _ApplyAttendanceState extends State<ApplyAttendance> {
  final MonthAttendance monthAttendance;
  int index;
  bool reasonValidate = false;
  bool entryValidate = false;
  bool exitValidate = false;

  _ApplyAttendanceState({this.monthAttendance, this.index});
  final reason = TextEditingController();
  final entry = TextEditingController();
  final exit = TextEditingController();
  final format = DateFormat("hh:mm a");
  final RoundedLoadingButtonController _btnController =
      new RoundedLoadingButtonController();
  ManualAttendance api = ManualAttendance();

  Future _doUpdate() async {
    await api
        .manualEntry(entry.text, exit.text, reason.text,
            monthAttendance.data.attendance[index].fullDate)
        .then((value) {
      _btnController.success();
      _doReset();
    });
  }

  void _doReset() async {
    Timer(Duration(seconds: 2), () {
      _btnController.reset();
    });
  }

  bool validateTextField(String manualEntry) {
    if (manualEntry.isEmpty) {
      setState(() {
        reasonValidate = true;
      });
      return false;
    }
    setState(() {
      reasonValidate = false;
    });
    return true;
  }

  bool validateEntryField(String entryTime) {
    if (entryTime.toString().isEmpty) {
      setState(() {
        entryValidate = true;
      });
      return false;
    }
    setState(() {
      entryValidate = false;
    });
    return true;
  }

  bool validateExitField(String exitTime) {
    if (exitTime.toString().isEmpty) {
      setState(() {
        exitValidate = true;
      });
      return false;
    }
    setState(() {
      exitValidate = false;
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 400,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                      margin: EdgeInsets.fromLTRB(16, 24, 16, 16),
                      child: Text(
                        "Your Day Summary",
                        style: TextStyle(
                            color: AppColors.THEME_COLOR,
                            fontSize: 16,
                            fontFamily: 'OpenSans'),
                      )),
                ),
              ],
            ),
            Divider(height: 1, thickness: 1, color: Colors.grey),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                      margin: EdgeInsets.fromLTRB(16, 16, 16, 4),
                      child: Text(
                        '*Entry/Exit time must be like e.g 10:30 AM, 07:30 PM',
                        style: TextStyle(
                            color: AppColors.THEME_COLOR,
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'OpenSans'),
                      )),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                      margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
                      child: Text(
                        "*Your Entry / Exit time, will be sent to the Admin for approval 20 min will be added/deducted from your entry/exit time as compensation in case you forgot to push in/out. If there is some other reason for your using this form contact HR",
                        style: TextStyle(
                            color: AppColors.THEME_COLOR,
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'OpenSans'),
                      )),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                      margin: EdgeInsets.all(8),
                      child: Text("Entry Time ",
                          style:
                              TextStyle(fontFamily: 'OpenSans', fontSize: 12))),
                ),
                Expanded(
                    flex: 2,
                    child: Column(children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 16),
                        child: DateTimeField(
                          key: Key('entryTimeKey'),
                          format: format,
                          controller: entry,
                          decoration: InputDecoration(
                              errorText:
                                  entryValidate ? "Select entry time" : null),
                          onShowPicker: (context, currentValue) async {
                            final time = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay(hour: 09, minute: 00),
                            );
                            return DateTimeField.convert(time);
                          },
                        ),
                      ),
                    ]))
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                      margin: EdgeInsets.all(8),
                      child: Text("Exit Time ",
                          style:
                              TextStyle(fontFamily: 'OpenSans', fontSize: 12))),
                ),
                Expanded(
                    flex: 2,
                    child: Column(children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 16),
                        child: DateTimeField(
                          key: Key('exitTimeKey'),
                          format: format,
                          controller: exit,
                          decoration: InputDecoration(
                              errorText:
                                  exitValidate ? "Select exit time" : null),
                          onShowPicker: (context, currentValue) async {
                            final time = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay(hour: 09, minute: 00),
                            );
                            return DateTimeField.convert(time);
                          },
                        ),
                      ),
                    ])),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                      margin: EdgeInsets.all(8),
                      child: Text("Reason ",
                          style:
                              TextStyle(fontFamily: 'OpenSans', fontSize: 14))),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(16, 12, 16, 0),
                    child: TextFormField(
                      key: Key('reasonKey'),
                      enabled: true,
                      controller: reason,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "",
                          errorText:
                              reasonValidate ? "Reason Can not be empty" : null,
                          labelStyle: TextStyle(
                              color: Colors.black,
                              fontFamily: 'OpenSans',
                              fontSize: 16)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.all(8),
              width: 80,
              child: RoundedLoadingButton(
                color: AppColors.BTN_BLACK_COLOR,
                width: 110,
                borderRadius: 10,
                controller: _btnController,
                onPressed: () {
                  if (!validateTextField(reason.text))
                    _btnController.stop();
                  else if (!validateEntryField(entry.text))
                    _btnController.stop();
                  else if (!validateExitField(exit.text))
                    _btnController.stop();
                  else {
                    _doUpdate();
                    Timer(Duration(seconds: 5), () {
                      Navigator.pop(context);
                    });
                  }
                },
                child: Text('Update', style: TextStyle(color: Colors.white)),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
