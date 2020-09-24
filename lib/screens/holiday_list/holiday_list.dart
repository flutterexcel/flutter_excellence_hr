import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_excellence_hr/screens/navigate/dropdown_inventory.dart';
import 'package:flutter_excellence_hr/screens/navigate/navigate.dart';
import 'package:flutter_excellence_hr/widgets/appbar.dart';

class HolidayList extends StatelessWidget {
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
              DropDown(),
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
                        "Holiday 2020",
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
                physics:NeverScrollableScrollPhysics(),
                itemCount: 15,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                            child: Container(
                          margin: EdgeInsets.fromLTRB(8, 16, 16, 16),
                          child: Text(
                            "New Years Day",
                            style: TextStyle(
                fontSize: 12,
                fontFamily: 'SourceSans'),
                          ))),
                      Expanded(
                            child: Container(
                          margin: EdgeInsets.fromLTRB(8, 16, 16, 16),
                          child: Text(
                            "January",
                            style: TextStyle(
                fontSize: 12,
                fontFamily: 'SourceSans'),
                          ))),
                      Expanded(
                            child: Container(
                          margin: EdgeInsets.fromLTRB(8, 16, 16, 16),
                          child: Text(
                            "2020-01-01",
                            style: TextStyle(
                fontSize: 12,
                fontFamily: 'SourceSans'),
                          ))),
                      Expanded(
                            child: Container(
                          margin: EdgeInsets.fromLTRB(8, 16, 16, 16),
                          child: Text(
                            "Wednesday",
                            style: TextStyle(
                fontSize: 12,
                fontFamily: 'SourceSans'),
                          ))),
                      Expanded(
                            child: Container(
                          margin: EdgeInsets.fromLTRB(8, 16, 8, 16),
                          child: Text(
                            "Normal",
                            style: TextStyle(
                fontSize: 12,
                fontFamily: 'SourceSans'),
                          ))),
                    ],
                  );
                }),
                      ],
                    ))
            ]),
          )),
    );
  }
}
