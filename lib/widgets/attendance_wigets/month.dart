import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_excellence_hr/bloc/attendance/attendance_bloc.dart';
import 'package:flutter_excellence_hr/model/attendance/month_attendance.dart';
import 'package:flutter_excellence_hr/services/storage_service.dart';

class Month extends StatelessWidget {
  final MonthAttendance monthAttendance;
  Month({this.monthAttendance});
  @override
  Widget build(BuildContext context) {
    final _attendanceBloc = BlocProvider.of<AttendanceBloc>(context);
    _getAttendance(String year, String month) {
      _attendanceBloc.add(LoadAttendance(
          month: month, year: year, userid: StorageUtil.getUserId()));
    }

    return Card(
        color: Colors.blue,
        child: ListTile(
            leading: IconButton(
              icon: Icon(Icons.keyboard_arrow_left),
              color: Colors.white,
              highlightColor: Colors.lightBlue,
              onPressed: () {
                _getAttendance(monthAttendance.data.previousMonth.year,
                    monthAttendance.data.previousMonth.month);
              },
            ),
            title: Text(
              monthAttendance.data.monthName +
                  " - " +
                  monthAttendance.data.year,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontFamily: 'SourceSans'),
            ),
            trailing: IconButton(
                icon: Icon(Icons.keyboard_arrow_right),
                color: Colors.white,
                highlightColor: Colors.lightBlue,
                onPressed: () {
                  _getAttendance(monthAttendance.data.nextMonth.year,
                      monthAttendance.data.nextMonth.month);
                })));
  }
}
