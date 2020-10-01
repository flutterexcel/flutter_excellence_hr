import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_excellence_hr/screens/navigate/navigate.dart';
import 'package:flutter_excellence_hr/widgets/appbar.dart';
import 'package:flutter_excellence_hr/widgets/apply_leave_widgets/apply_leave_widgets.dart';

class ApplyLeave extends StatelessWidget {
  final from = TextEditingController();
    final to = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BACKGROUND_COLOR,
      appBar: AppBar(
        title: AppBarWidget(
          pageName: "Apply Leave",
        ),
      ),
      drawer: Navigation(),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: <Widget>[
        LeaveCalendar(),           
        ]),
      )),
    );
  }
}