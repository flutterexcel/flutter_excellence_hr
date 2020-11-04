part of 'attendance_bloc.dart';

abstract class AttendanceEvent extends Equatable {
  const AttendanceEvent();

  @override
  List<Object> get props => [];
}

class AttendanceInit extends AttendanceEvent {}

class LoadAttendance extends AttendanceEvent {
  String month, year, userid;

  LoadAttendance({this.month, this.year, this.userid});
}
