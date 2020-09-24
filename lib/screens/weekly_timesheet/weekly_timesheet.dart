import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_excellence_hr/screens/navigate/navigation.dart';
import 'package:flutter_excellence_hr/widgets/appbar.dart';
import 'package:flutter_excellence_hr/widgets/document_widgets/document_widgets.dart';
import 'package:flutter_excellence_hr/widgets/profile_widgets/profile_widgets.dart';
import 'package:flutter_excellence_hr/widgets/timesheet_widgets/timesheet_widgets.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class WeeklyTimeSheet extends StatelessWidget {
  final totalTime = TextEditingController();
  final comment = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: [
                          Container(
                              margin: EdgeInsets.all(16),
                              child: Text(
                                "Monday Time Sheet",
                                style: TextStyle(
                                    fontSize: 18, fontFamily: 'OpenSans'),
                              )),
                        ],
                      ),
                      Divider(height: 1, thickness: .5, color: Colors.grey),
                      SizedBox(
                        height: 16,
                      ),
                      Row(crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                                margin: EdgeInsets.only(left: 16),
                                child: Text("Total Time ",
                                    style: TextStyle(
                                        fontFamily: 'OpenSans', fontSize: 16))),
                          ),
                        ],
                      ),
                      Row(crossAxisAlignment: CrossAxisAlignment.center,
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
                                        fontSize: 16)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(crossAxisAlignment: CrossAxisAlignment.center,
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
                      Row(crossAxisAlignment: CrossAxisAlignment.center,
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
                                  hintText: "",
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      
                      Row(crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                                margin: EdgeInsets.fromLTRB(16, 8, 16, 16),
                                height: 45,
                                child: Text(
                                    'Its better if you put your detail reports on tms and HR system will automatically fetch it for you',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
                          ),
                        ],
                      ),
                      Row(crossAxisAlignment: CrossAxisAlignment.center,
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
                      Row(crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
                              child: UploadPic(),
                            ),
                          ),
                        ],
                      ),
                      RoundedLoadingButton(
                        color: AppColors.GREEN_COLOR,
                        width: 150,
                        borderRadius: 10,
                        onPressed: () {},
                        child: Text('Submit',
                            style: TextStyle(color: Colors.white)),
                      ),
                      SizedBox(height:30)
                    ],
                  ),
                ),
              ),
            );
          });
    }

    return Scaffold(
      backgroundColor: AppColors.BACKGROUND_COLOR,
      appBar: AppBar(title: AppBarWidget(pageName: "Weekly Timesheet")),
      drawer: Navigation(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
        },
        label: Text('Submit Weekly Timesheet'),
        backgroundColor: AppColors.GREEN_COLOR,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: <Widget>[
          Header(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: Container(
                      margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
                      child: Text(
                        'Monday',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'SourceSans',
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ))),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
                      child: Text(
                        'Tuesday',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'SourceSans',
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ))),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
                      child: Text(
                        'Wednesday',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'SourceSans',
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ))),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: InkWell(
                onTap: () {
                  customDialog();
                },
                child: Container(
                    color: Colors.grey[300],
                    margin: EdgeInsets.fromLTRB(8, 8, 1, 1),
                    padding: EdgeInsets.fromLTRB(8, 8, 8, 16),
                    child: Text('21',
                        style:
                            TextStyle(fontFamily: 'OpenSans', fontSize: 14))),
              )),
              Expanded(
                  child: Container(
                      color: Colors.grey[300],
                      margin: EdgeInsets.fromLTRB(1, 8, 1, 1),
                      padding: EdgeInsets.fromLTRB(8, 8, 8, 16),
                      child: Text('22',
                          style: TextStyle(
                              fontFamily: 'OpenSans', fontSize: 14)))),
              Expanded(
                  child: Container(
                      color: Colors.grey[300],
                      margin: EdgeInsets.fromLTRB(1, 8, 8, 1),
                      padding: EdgeInsets.fromLTRB(8, 8, 8, 16),
                      child: Text('23',
                          style: TextStyle(
                              fontFamily: 'OpenSans', fontSize: 14)))),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: InkWell(
                onTap: () {
                  customDialog();
                },
                child: Container(
                    margin: EdgeInsets.fromLTRB(8, 0, 1, 8),
                    padding: EdgeInsets.fromLTRB(8, 8, 8, 16),
                    child: Text('9 - Total Hours',
                        style:
                            TextStyle(fontFamily: 'OpenSans', fontSize: 14))),
              )),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.fromLTRB(1, 0, 1, 8),
                      padding: EdgeInsets.fromLTRB(8, 8, 8, 16),
                      child: Text('9 - Total Hours',
                          style: TextStyle(
                              fontFamily: 'OpenSans', fontSize: 14)))),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.fromLTRB(1, 0, 8, 8),
                      padding: EdgeInsets.fromLTRB(8, 8, 8, 16),
                      child: Text('9 - Total Hours',
                          style: TextStyle(
                              fontFamily: 'OpenSans', fontSize: 14)))),
            ],
          ),
          SaveStates(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: Container(
                      margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
                      child: Text(
                        'Thusday',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'SourceSans',
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ))),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
                      child: Text(
                        'Friday',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'SourceSans',
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ))),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
                      child: Text(
                        'Saturday',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'SourceSans',
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ))),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: Container(
                      color: Colors.grey[300],
                      margin: EdgeInsets.fromLTRB(8, 8, 1, 1),
                      padding: EdgeInsets.fromLTRB(8, 8, 8, 16),
                      child: Text('24',
                          style: TextStyle(
                              fontFamily: 'OpenSans', fontSize: 14)))),
              Expanded(
                  child: Container(
                      color: Colors.grey[300],
                      margin: EdgeInsets.fromLTRB(1, 8, 1, 1),
                      padding: EdgeInsets.fromLTRB(8, 8, 8, 16),
                      child: Text('25',
                          style: TextStyle(
                              fontFamily: 'OpenSans', fontSize: 14)))),
              Expanded(
                  child: Container(
                      color: Colors.grey[300],
                      margin: EdgeInsets.fromLTRB(1, 8, 8, 1),
                      padding: EdgeInsets.fromLTRB(8, 8, 8, 16),
                      child: Text('26',
                          style: TextStyle(
                              fontFamily: 'OpenSans', fontSize: 14)))),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: Container(
                      color: Colors.grey[300],
                      margin: EdgeInsets.fromLTRB(8, 0, 1, 8),
                      padding: EdgeInsets.fromLTRB(8, 8, 8, 16),
                      child: Text('0 - Total Hours',
                          style: TextStyle(
                              fontFamily: 'OpenSans', fontSize: 14)))),
              Expanded(
                  child: Container(
                      color: Colors.grey[300],
                      margin: EdgeInsets.fromLTRB(1, 0, 1, 8),
                      padding: EdgeInsets.fromLTRB(8, 8, 8, 16),
                      child: Text('0 - Total Hours',
                          style: TextStyle(
                              fontFamily: 'OpenSans', fontSize: 14)))),
              Expanded(
                  child: Container(
                      color: Colors.grey[300],
                      margin: EdgeInsets.fromLTRB(1, 0, 8, 8),
                      padding: EdgeInsets.fromLTRB(8, 8, 8, 16),
                      child: Text('0 - Total Hours',
                          style: TextStyle(
                              fontFamily: 'OpenSans', fontSize: 14)))),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                    margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
                    child: Text(
                      'Sunday',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'SourceSans',
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              Expanded(flex: 2, child: Container())
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                    color: Colors.yellowAccent,
                    height: 70,
                    margin: EdgeInsets.fromLTRB(8, 8, 1, 1),
                    padding: EdgeInsets.fromLTRB(8, 8, 8, 16),
                    child: Text('26',
                        style:
                            TextStyle(fontFamily: 'OpenSans', fontSize: 14))),
              ),
              Expanded(flex: 2, child: Container()),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                    color: Colors.yellowAccent,
                    height: 16,
                    padding: EdgeInsets.all(1),
                    margin: EdgeInsets.fromLTRB(8, 0, 1, 1),
                    child: Text('Weekends of',
                        style: TextStyle(fontSize: 12, color: Colors.black))),
              ),
              Expanded(flex: 2, child: Container()),
            ],
          ),
        ]),
      )),
    );
  }
}
