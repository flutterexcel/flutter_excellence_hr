import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../services/attendance/month_attendance.dart';
part 'attendance_event.dart';
part 'attendance_state.dart';

class AttendanceBloc extends Bloc<AttendanceEvent, AttendanceState> {
  AttendanceBloc() : super(AttendanceInitial());
  final GetAttendance attendanceApi = GetAttendance();
  @override
  Stream<AttendanceState> mapEventToState(
    AttendanceEvent event,
  ) async* {
    if (event is AttendanceInit) {
      yield AttendanceInitial();
    }
    if (event is LoadAttendance) {
      yield* _mapUserAttendanceToState(event);
    }
  }

  Stream<AttendanceState> _mapUserAttendanceToState(
      LoadAttendance event) async* {
    yield AttendanceLoading();
    try {
      final attendance = await attendanceApi.getAttendance(
          event.month, event.year, event.userid);
      yield AttendanceSuccess(data: attendance);
    } catch (e, s) {
      yield AttendanceFailure();
    }
  }
}
