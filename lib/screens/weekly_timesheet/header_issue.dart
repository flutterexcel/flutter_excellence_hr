import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_excellence_hr/screens/navigate/navigation.dart';
import 'package:flutter_excellence_hr/widgets/appbar.dart';
import 'package:flutter_excellence_hr/widgets/timesheet_widgets/timesheet_widgets.dart';

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

    return Scaffold(
      backgroundColor: AppColors.BACKGROUND_COLOR,
      appBar: AppBar(title: AppBarWidget(pageName: "Weekly Timesheet")),
      drawer: Navigation(),
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
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'OpenSans'),
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
                      });
                    },
                    child: Icon(
                      Icons.arrow_right,
                      color: Colors.white,
                    ),
                  ),
                )),
            Content(firstDayOfTheweek: firstDayOfTheweek)
          ],
        ),
      )),
    );
  }
}
