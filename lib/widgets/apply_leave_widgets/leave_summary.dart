import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_excellence_hr/services/attendance/apply_leave.dart';
import 'package:flutter_excellence_hr/widgets/apply_leave_widgets/dropdown_rh.dart';
import 'package:intl/intl.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LeaveCalendar extends StatefulWidget {
  @override
  _LeaveCalendarState createState() => _LeaveCalendarState();
}

class _LeaveCalendarState extends State<LeaveCalendar> {
  DateTime _currentDate = DateTime.now();
  DateTime _lastDate = DateTime.now();
  final from = TextEditingController();
  final to = TextEditingController();
  final noOfDay = TextEditingController();
  final reason = TextEditingController();
  final lateReason = TextEditingController();
  String leaveType, rhdate;
  ApplyLeave api = ApplyLeave();//
  bool reasonValidate = false;
  bool lateReasonValidate = false;
  bool leaveColor = false;
  bool type = false;

  Future _doApply({String leavetype, String rhdate = ''}) async {
    await api.applyLeave(
        fromDate: from.text,
        toDate: to.text,
        noOfDays: noOfDay.text,
        reason: reason.text,
        lateReason: lateReason.text,
        leaveType: leavetype,
        rhDates: [rhdate]);
  }

  void _doReset() async {
    Timer(Duration(seconds: 2), () {
      _btnController.reset();
    });
  }

  final RoundedLoadingButtonController _btnController =
      new RoundedLoadingButtonController();
  DropDown dropdown;
  Future<Null> _selectedDate(BuildContext context) async {
    var today = DateTime.now();
    final DateTime _selDate = await showDatePicker(
        context: context,
        initialDate: _currentDate,
        firstDate: DateTime(today.year - 1),
        lastDate: DateTime(today.year + 1),
        builder: (context, child) {
          return SingleChildScrollView(child: child);
        });

    if (_selDate != null) {
      setState(() {
        _currentDate = _selDate;
        _lastDate = _selDate;
      });
    }
  }

  Future<Null> _secondDate(BuildContext context) async {
    var today = DateTime.now();

    final DateTime _selDate = await showDatePicker(
        context: context,
        initialDate: _currentDate,
        firstDate: _currentDate,
        lastDate: DateTime(today.year + 1),
        builder: (context, child) {
          return SingleChildScrollView(child: child);
        });
    if (_selDate != null) {
      setState(() {
        _lastDate = _selDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var _formattedDate = DateFormat.yMMMd().format(_currentDate);
    var _toDate = DateFormat.yMMMd().format(_lastDate);
    int difference = 1;
    if (DateFormat("yyyy-MM-dd").format(_lastDate).toString() !=
        DateFormat("yyyy-MM-dd").format(_currentDate).toString()) {
      DateTime currentTime =
          DateTime(_currentDate.year, _currentDate.month, _currentDate.day);
      difference = _lastDate.difference(currentTime).inDays + 1;
      DateTime dateTime = DateTime.now();
      int _curr_diff = _lastDate.difference(dateTime).inDays;
      setState(() {
        if (_curr_diff <= 0) {
          lateReasonValidate = true;
        } else
          lateReasonValidate = false;
      });
    }

    bool validateTextField(String leaveReason) {
      if (leaveReason.isEmpty) {
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

    void alertDialog(BuildContext context) {
      var alert = AlertDialog(
        title: Text('Alert Dialog'),
        content: Text('Select Leave Type From List'),
        actions: <Widget>[
          FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'OK',
                style: TextStyle(fontSize: 20),
              ))
        ],
      );
      showDialog(
          context: context,
          builder: (BuildContext c) {
            return alert;
          });
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsets.all(16),
                child: Text(
                  "Leave Summary",
                  style: TextStyle(fontSize: 18, fontFamily: 'OpenSans'),
                )),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                  margin: EdgeInsets.all(8),
                  child: Text("From ",
                      style: TextStyle(fontFamily: 'OpenSans', fontSize: 16))),
            ),
            Expanded(
              flex: 4,
              child: InkWell(
                onTap: () {
                  _btnController.reset();
                  _selectedDate(context);
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
                  height: 35,
                  child: TextFormField(
                    key: Key('fromDateKey'),
                    enabled: false,
                    controller: from
                      ..text = DateFormat("yyyy-MM-dd")
                          .format(_currentDate)
                          .toString(),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "$_formattedDate",
                        labelStyle: TextStyle(
                            color: Colors.black,
                            fontFamily: 'OpenSans',
                            fontSize: 16)),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                  margin: EdgeInsets.all(8),
                  child: Text("To ",
                      style: TextStyle(fontFamily: 'OpenSans', fontSize: 16))),
            ),
            Expanded(
              flex: 4,
              child: InkWell(
                onTap: () {
                  _btnController.reset();
                  _secondDate(context);
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
                  height: 35,
                  child: TextFormField(
                    key: Key('toDateKey'),
                    enabled: false,
                    controller: to
                      ..text =
                          DateFormat("yyyy-MM-dd").format(_lastDate).toString(),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "$_toDate",
                        labelStyle: TextStyle(
                            color: Colors.black,
                            fontFamily: 'OpenSans',
                            fontSize: 16)),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                  margin: EdgeInsets.all(8),
                  child: Text("Leave Type ",
                      style: TextStyle(fontFamily: 'OpenSans', fontSize: 16))),
            ),
            Expanded(
              flex: 4,
              child: Container(
                margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
                height: 55,
                child: DropDown(
                  onLeaveChange: (String leave) {
                    setState(() {});
                    leaveType = leave;
                  },
                  onRHChange: (String rh) {
                    rhdate = rh;
                  },
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                  margin: EdgeInsets.all(8),
                  child: Text("No of Days ",
                      style: TextStyle(fontFamily: 'OpenSans', fontSize: 16))),
            ),
            Expanded(
              flex: 4,
              child: Container(
                margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                height: 35,
                child: TextFormField(
                  enabled: false,
                  controller: noOfDay..text = "$difference",
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "$difference",
                      labelStyle: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSans',
                          fontSize: 16)),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(),
            ),
            Expanded(
              flex: 4,
              child: Container(
                  margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                  height: 75,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              noOfDay.text = ".5";
                            },
                            child: Container(
                              width: 200,
                              child: Text(
                                'Apply Leave For First Half/',
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontFamily: 'OpenSans',
                                    fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              noOfDay.text = ".5";
                            },
                            child: Container(
                              width: 200,
                              child: Text(
                                'Apply Leave For Second Half',
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontFamily: 'OpenSans',
                                    fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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
                  child: Text("Reason ",
                      style: TextStyle(fontFamily: 'OpenSans', fontSize: 16))),
            ),
            Expanded(
              flex: 4,
              child: Container(
                margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
                height: 100,
                child: TextFormField(
                  key: Key('reasonKey'),
                  enabled: true,
                  maxLines: 5,
                  controller: reason,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Give Reason",
                    errorText:
                        reasonValidate ? "Reason Can not be empty" : null,
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                  margin: EdgeInsets.all(8),
                  child: Text("Late Reason",
                      style: TextStyle(fontFamily: 'OpenSans', fontSize: 16))),
            ),
            Expanded(
              flex: 4,
              child: Container(
                margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
                height: 100,
                child: TextFormField(
                  enabled: lateReasonValidate,
                  maxLines: 5,
                  controller: lateReason,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Give Late Reason",
                    errorText:
                        reasonValidate ? "Reason Can not be empty" : null,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * .9,
          child: RoundedLoadingButton(
            color: AppColors.BTN_BLACK_COLOR,
            width: 150,
            borderRadius: 10,
            controller: _btnController,
            onPressed: () async {
              if (leaveType == "Leave Option" || leaveType == null) {
                validateTextField(reason.text);
                alertDialog(context);
                _btnController.stop();
              } else {
                {
                  if (!validateTextField(reason.text))
                    _btnController.stop();
                  else {
                    await _doApply(leavetype: leaveType, rhdate: rhdate)
                        .then((value) {
                      _btnController.success();
                      _doReset();
                    });
                  }
                }
              }
            },
            child: Text('Apply Leave', style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }
}
