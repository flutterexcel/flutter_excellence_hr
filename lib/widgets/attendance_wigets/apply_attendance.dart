import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/model/attendance/month_attendance.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_excellence_hr/services/attendance/manual_entry.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class ApplyAttendance extends StatelessWidget {
  final MonthAttendance monthAttendance;
  int index;
  ApplyAttendance({this.monthAttendance, this.index});
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
        .then((value) => _btnController.success());
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
                        "Shakti Tripathi Your Day Summary of 2020-09-18",
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
                      DateTimeField(
                        format: format,
                        controller: entry,
                        onShowPicker: (context, currentValue) async {
                          final time = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay(hour: 09, minute: 00),
                          );
                          return DateTimeField.convert(time);
                        },
                      ),
                    ]))
              ],
            ),
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
                      DateTimeField(
                        format: format,
                        controller: exit,
                        onShowPicker: (context, currentValue) async {
                          final time = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay(hour: 09, minute: 00),
                          );
                          return DateTimeField.convert(time);
                        },
                      ),
                    ])),
              ],
            ),
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
                    height: 35,
                    child: TextFormField(
                      enabled: true,
                      controller: reason,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "",
                          labelStyle: TextStyle(
                              color: Colors.black,
                              fontFamily: 'OpenSans',
                              fontSize: 16)),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(8),
              width: 80,
              child: RoundedLoadingButton(
                color: AppColors.BLUE_COLOR,
                width: 110,
                borderRadius: 10,
                controller: _btnController,
                onPressed: () async {
                  await _doUpdate().then((value) => Navigator.pop(context));
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
