import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

class Calander extends StatefulWidget {
  @override
  _CalanderState createState() => _CalanderState();
}

class _CalanderState extends State<Calander> {
  DateTime _currentDate;

  var _markedDateMap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          child: CalendarCarousel<EventInterface>(
            onDayPressed: (DateTime date, List<EventInterface> events) {
              this.setState(() => _currentDate = date);
            },
            weekendTextStyle: TextStyle(
              color: Colors.red,
            ),
            thisMonthDayBorderColor: Colors.grey,
            todayButtonColor: Colors.blueAccent,
            customDayBuilder: (
              bool isSelectable,
              int index,
              bool isSelectedDay,
              bool isToday,
              bool isPrevMonthDay,
              TextStyle textStyle,
              bool isNextMonthDay,
              bool isThisMonthDay,
              DateTime day,
            ) {
              var d = day.day;
              if (day.day <= 15 && isThisMonthDay) {
                return Card(
                  color: (d == 5 || d == 6 || d == 13 || d == 19 || d == 27)
                      ? Colors.yellowAccent
                      : Colors.blueAccent,
                  child: (d == 5 || d == 6 || d == 13 || d == 19 || d == 27)
                      ? Text('Holiday', style: TextStyle(color: Colors.black))
                      : SingleChildScrollView(
                          child: Column(
                            children: [
                              Text(
                                "$d",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                '10:24 am- 7:34 PM',
                                style: TextStyle(color: Colors.white),
                              ),
                              Container(
                                  margin: EdgeInsets.all(8),
                                  color: Colors.redAccent,
                                  child: Text(
                                    '0h:1m:20 sec',
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ],
                          ),
                        ),
                );
              } else {
                return null;
              }
            },
            weekFormat: false,
            markedDatesMap: _markedDateMap,
            height: 420.0,
            selectedDateTime: _currentDate,
            daysHaveCircularBorder: false,
            /// null for not rendering any border, true for circular border, false for rectangular border
          ),
        ),
        SizedBox(height: 30),
      ],
    );
  }
}
