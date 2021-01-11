import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/model/timesheet/timesheet.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_excellence_hr/screens/weekly_timesheet/header_issue.dart';
import 'package:flutter_excellence_hr/services/timesheet/timesheet.dart';

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  var varible;
  DateTime now = DateTime.now();

  double week;
  TimeSheetService api = TimeSheetService();
  TimeSheet timeSheet;
  DateTime firstDayOfTheweek;
  String titleDate = "";

  String month = "";

  @override
  Widget build(BuildContext context) {
    week = now.day / 7 + 1;
    firstDayOfTheweek = now.subtract(new Duration(days: now.weekday - 1));
    //print("First day of week " + firstDayOfTheweek.day.toString());
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
    return Container(
        color: AppColors.BLUE_COLOR,
        margin: EdgeInsets.all(8),
        child: ListTile(
          leading: InkWell(
            onTap: () {
              now = now.subtract(Duration(days: 7));
              firstDayOfTheweek =
                  now.subtract(new Duration(days: now.weekday - 1));
              print("updated prev First day of week " +
                  firstDayOfTheweek.day.toString());
              setState(() {
                titleDate = " week " +
                    week.toStringAsFixed(0) +
                    " " +
                    month +
                    " " +
                    now.year.toString();
              });
            },
            child: Icon(
              Icons.arrow_left,
              color: Colors.white,
            ),
          ),
          title: Text(
            titleDate,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontFamily: 'OpenSans'),
          ),
          trailing: InkWell(
            onTap: () {
              now = now.add(Duration(days: 7));
              firstDayOfTheweek =
                  now.subtract(new Duration(days: now.weekday - 1));
              print("updated First day of week " +
                  firstDayOfTheweek.day.toString() +
                  " year" +
                  firstDayOfTheweek.year.toString());
              setState(() {
                titleDate = " week " +
                    week.toStringAsFixed(0) +
                    " " +
                    month +
                    " " +
                    now.year.toString();
                // TimeSheetUI(firstDayOfTheweek: firstDayOfTheweek);
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (BuildContext context) {
                //   return TimeSheetUI(firstDayOfTheweek: firstDayOfTheweek);
                // }));
              });
            },
            child: Icon(
              Icons.arrow_right,
              color: Colors.white,
            ),
          ),
        ));
  }
}
