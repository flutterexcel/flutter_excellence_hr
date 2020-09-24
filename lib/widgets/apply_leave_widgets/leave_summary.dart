import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_excellence_hr/screens/navigate/dropdown_inventory.dart';
import 'package:intl/intl.dart';

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
  
  Future<Null> _selectedDate(BuildContext context) async {
    final DateTime _selDate = await showDatePicker(
        context: context,
        initialDate: _currentDate,
        firstDate: DateTime(2019),
        lastDate: DateTime(2025),        
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
    final DateTime _selDate = await showDatePicker(
        context: context,
        initialDate: _currentDate,
        firstDate: _currentDate,
        lastDate: DateTime(2025),
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
    String _formattedDate = DateFormat.yMMMd().format(_currentDate);
    String _toDate = DateFormat.yMMMd().format(_lastDate);
    final int difference = (_lastDate==_currentDate) ?1: (_lastDate.difference(_currentDate).inDays==0?2:_lastDate.difference(_currentDate).inDays);
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
                  _selectedDate(context);
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
                  height: 35,
                  child: TextFormField(
                    enabled: false,
                    controller: from,
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
                  _secondDate(context);
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
                  height: 35,
                  child: TextFormField(
                    enabled: false,
                    controller: to,
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
                child: DropDown(),
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
                  controller: noOfDay,
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
                  enabled: true,
                  maxLines: 5,
                  controller: reason,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Give Reason",
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * .9,
          child: RaisedButton(
            color: AppColors.GREEN_COLOR,
            onPressed: () {},
            child: const Text('Apply',
                style: TextStyle(
                    color: Colors.white, fontSize: 18, fontFamily: 'OpenSans')),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
      ],
    );
  }
}
