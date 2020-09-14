import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_excellence_hr/screens/navigate/navigate.dart';
import 'package:flutter_excellence_hr/widgets/appbar.dart';
import 'package:flutter_excellence_hr/widgets/attendance_wigets/attendance_widgets.dart';

class MyAttendance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BACKGROUND_COLOR,
      appBar: AppBar(title: AppBarWidget(pageName: "My Attendance")),
      drawer: Navigation(),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: <Widget>[
          Month(),
          NameDesignation(name: "Shakti",designation: "Jr.Mobile App Developer",),
          CompletePending(),  
          TimeCompensate(),
                      
        ]),
      )),
    );
  }
}