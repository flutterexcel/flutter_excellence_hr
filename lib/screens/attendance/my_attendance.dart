import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_excellence_hr/bloc/attendance/attendance_bloc.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_excellence_hr/screens/navigate/navigate.dart';
import 'package:flutter_excellence_hr/widgets/appbar.dart';
import 'package:flutter_excellence_hr/widgets/attendance_wigets/attendance_widgets.dart';
import 'package:flutter_excellence_hr/widgets/attendance_wigets/calendar.dart';
import '../../model/attendance/month_attendance.dart';
import '../../services/storage_service.dart';
import 'package:sticky_headers/sticky_headers.dart';

class MyAttendance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _attendanceBloc = BlocProvider.of<AttendanceBloc>(context);
    return BlocBuilder<AttendanceBloc, AttendanceState>(
        builder: (context, state) {
      if (state is AttendanceLoading) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Center(
              child: CircularProgressIndicator(backgroundColor: Colors.cyan)),
        );
      }

      if (state is AttendanceInitial) {
        var date = new DateTime.now().toString();
        var dateParse = DateTime.parse(date);
        _attendanceBloc.add(LoadAttendance(
            month: dateParse.month.toString(),
            year: dateParse.year.toString(),
            userid: StorageUtil.getUserId()));
        return Center();
      }
      if (state is AttendanceSuccess) {
        MonthAttendance attendance = state.data;
        return Scaffold(
            backgroundColor: AppColors.BACKGROUND_COLOR,
            appBar: AppBar(title: AppBarWidget(pageName: "My Attendance")),
            drawer: Navigation(),
            body: SafeArea(
              child: SingleChildScrollView(
                  child: StickyHeader(
                header: Month(monthAttendance: state.data),
                content: Column(children: <Widget>[
                  NameDesignation(
                      name: attendance.data.userName,
                      designation: attendance.data.userjobtitle,
                      image: attendance.data.userProfileImage),
                  CompletePending(monthSummary: attendance.data.monthSummary),
                  TimeCompensate(monthAttendance: state.data),
                  DayRefrence(monthAttendance: state.data),
                  //for (var i = 1; i <= 30; i++)
                  CalendarScreen(monthAttendance: state.data),
                ]),
              )),
            ));
      }
    });
  }
}
