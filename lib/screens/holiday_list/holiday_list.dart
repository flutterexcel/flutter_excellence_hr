import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/model/holiday/holiday.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_excellence_hr/widgets/holiday/dropdown_year.dart';
import 'package:flutter_excellence_hr/screens/navigate/navigate.dart';
import 'package:flutter_excellence_hr/widgets/appbar.dart';

class HolidayList extends StatefulWidget {
  @override
  _HolidayListState createState() => _HolidayListState();
}

class _HolidayListState extends State<HolidayList> {
  Holiday holidays;
  String yearSelect;
  bool getHoldays = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BACKGROUND_COLOR,
      appBar: AppBar(
        title: AppBarWidget(
          pageName: "Holiday List",
        ),
      ),
      drawer: Navigation(),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: <Widget>[
          DropDown(
            onYearChange: (Future<dynamic> holiday, String year) {
              yearSelect = year;
              holiday.then((value) {
                setState(() {
                  holidays = value;
                  getHoldays = true;
                });
              });
            },
          ),
          if (getHoldays) ...{
            Card(
                margin: EdgeInsets.fromLTRB(8, 8, 8, 32),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Container(
                                margin: EdgeInsets.fromLTRB(8, 16, 16, 16),
                                child: Text(
                                  "Holiday " + yearSelect,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'SourceSans',
                                      fontWeight: FontWeight.bold),
                                ))),
                        Expanded(
                            child: Container(
                                margin: EdgeInsets.fromLTRB(8, 16, 16, 16),
                                child: Text(
                                  "MONTH",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'SourceSans',
                                      fontWeight: FontWeight.bold),
                                ))),
                        Expanded(
                            child: Container(
                                margin: EdgeInsets.fromLTRB(8, 16, 16, 16),
                                child: Text(
                                  "DATE",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'SourceSans',
                                      fontWeight: FontWeight.bold),
                                ))),
                        Expanded(
                            child: Container(
                                margin: EdgeInsets.fromLTRB(8, 16, 16, 16),
                                child: Text(
                                  "DAY",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'SourceSans',
                                      fontWeight: FontWeight.bold),
                                ))),
                        Expanded(
                            child: Container(
                                margin: EdgeInsets.fromLTRB(8, 16, 8, 16),
                                child: Text(
                                  "TYPE",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'SourceSans',
                                      fontWeight: FontWeight.bold),
                                ))),
                      ],
                    ),
                    ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: holidays.data.holidays.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: Container(
                                      margin:
                                          EdgeInsets.fromLTRB(8, 16, 16, 16),
                                      child: Text(
                                        holidays.data.holidays[index].name,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'SourceSans'),
                                      ))),
                              Expanded(
                                  child: Container(
                                      margin:
                                          EdgeInsets.fromLTRB(8, 16, 16, 16),
                                      child: Text(
                                        holidays.data.holidays[index].month,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'SourceSans'),
                                      ))),
                              Expanded(
                                  child: Container(
                                      margin:
                                          EdgeInsets.fromLTRB(8, 16, 16, 16),
                                      child: Text(
                                        holidays.data.holidays[index].date,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'SourceSans'),
                                      ))),
                              Expanded(
                                  child: Container(
                                      margin:
                                          EdgeInsets.fromLTRB(8, 16, 16, 16),
                                      child: Text(
                                        holidays.data.holidays[index].dayOfWeek,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'SourceSans'),
                                      ))),
                              Expanded(
                                  child: Container(
                                      margin: EdgeInsets.fromLTRB(8, 16, 8, 16),
                                      child: Text(
                                        holidays.data.holidays[index].typeText,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'SourceSans'),
                                      ))),
                            ],
                          );
                        }),
                  ],
                ))
          } else ...{
            CircularProgressIndicator(backgroundColor: Colors.cyan)
          }
        ]),
      )),
    );
  }
}
