class MonthAttendance {
  int error;
  Data data;

  MonthAttendance({this.error, this.data});

  MonthAttendance.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String userProfileImage;
  String userName;
  String userjobtitle;
  String userid;
  String year;
  String month;
  String monthName;
  MonthSummary monthSummary;
  NextMonth nextMonth;
  NextMonth previousMonth;
  List<Attendance> attendance;
  CompensationSummary compensationSummary;
  String message;

  Data(
      {this.userProfileImage,
      this.userName,
      this.userjobtitle,
      this.userid,
      this.year,
      this.month,
      this.monthName,
      this.monthSummary,
      this.nextMonth,
      this.previousMonth,
      this.attendance,
      this.compensationSummary,
      this.message});

  Data.fromJson(Map<String, dynamic> json) {
    userProfileImage = json['userProfileImage'];
    userName = json['userName'];
    userjobtitle = json['userjobtitle'];
    userid = json['userid'];
    year = json['year'];
    month = json['month'];
    monthName = json['monthName'];
    monthSummary = json['monthSummary'] != null
        ? new MonthSummary.fromJson(json['monthSummary'])
        : null;
    nextMonth = json['nextMonth'] != null
        ? new NextMonth.fromJson(json['nextMonth'])
        : null;
    previousMonth = json['previousMonth'] != null
        ? new NextMonth.fromJson(json['previousMonth'])
        : null;
    if (json['attendance'] != null) {
      attendance = new List<Attendance>();
      json['attendance'].forEach((v) {
        attendance.add(new Attendance.fromJson(v));
      });
    }
    compensationSummary = json['compensationSummary'] != null
        ? new CompensationSummary.fromJson(json['compensationSummary'])
        : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userProfileImage'] = this.userProfileImage;
    data['userName'] = this.userName;
    data['userjobtitle'] = this.userjobtitle;
    data['userid'] = this.userid;
    data['year'] = this.year;
    data['month'] = this.month;
    data['monthName'] = this.monthName;
    if (this.monthSummary != null) {
      data['monthSummary'] = this.monthSummary.toJson();
    }
    if (this.nextMonth != null) {
      data['nextMonth'] = this.nextMonth.toJson();
    }
    if (this.previousMonth != null) {
      data['previousMonth'] = this.previousMonth.toJson();
    }
    if (this.attendance != null) {
      data['attendance'] = this.attendance.map((v) => v.toJson()).toList();
    }
    if (this.compensationSummary != null) {
      data['compensationSummary'] = this.compensationSummary.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class MonthSummary {
  String actualWorkingHours;
  String completedWorkingHours;
  String pendingWorkingHours;
  int wORKINGDAY;
  int nONWORKINGDAY;
  int lEAVEDAY;
  int hALFDAY;
  String adminAlert;
  String adminAlertMessage;
  int secondsActualWorkingHours;
  int secondsCompletedWorkingHours;
  int secondsPendingWorkingHours;

  MonthSummary(
      {this.actualWorkingHours,
      this.completedWorkingHours,
      this.pendingWorkingHours,
      this.wORKINGDAY,
      this.nONWORKINGDAY,
      this.lEAVEDAY,
      this.hALFDAY,
      this.adminAlert,
      this.adminAlertMessage,
      this.secondsActualWorkingHours,
      this.secondsCompletedWorkingHours,
      this.secondsPendingWorkingHours});

  MonthSummary.fromJson(Map<String, dynamic> json) {
    actualWorkingHours = json['actual_working_hours'];
    completedWorkingHours = json['completed_working_hours'];
    pendingWorkingHours = json['pending_working_hours'];
    wORKINGDAY = json['WORKING_DAY'];
    nONWORKINGDAY = json['NON_WORKING_DAY'];
    lEAVEDAY = json['LEAVE_DAY'];
    hALFDAY = json['HALF_DAY'];
    adminAlert = json['admin_alert'];
    adminAlertMessage = json['admin_alert_message'];
    secondsActualWorkingHours = json['seconds_actual_working_hours'];
    secondsCompletedWorkingHours = json['seconds_completed_working_hours'];
    secondsPendingWorkingHours = json['seconds_pending_working_hours'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['actual_working_hours'] = this.actualWorkingHours;
    data['completed_working_hours'] = this.completedWorkingHours;
    data['pending_working_hours'] = this.pendingWorkingHours;
    data['WORKING_DAY'] = this.wORKINGDAY;
    data['NON_WORKING_DAY'] = this.nONWORKINGDAY;
    data['LEAVE_DAY'] = this.lEAVEDAY;
    data['HALF_DAY'] = this.hALFDAY;
    data['admin_alert'] = this.adminAlert;
    data['admin_alert_message'] = this.adminAlertMessage;
    data['seconds_actual_working_hours'] = this.secondsActualWorkingHours;
    data['seconds_completed_working_hours'] = this.secondsCompletedWorkingHours;
    data['seconds_pending_working_hours'] = this.secondsPendingWorkingHours;
    return data;
  }
}

class NextMonth {
  String year;
  String month;
  String monthName;

  NextMonth({this.year, this.month, this.monthName});

  NextMonth.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    month = json['month'];
    monthName = json['monthName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['year'] = this.year;
    data['month'] = this.month;
    data['monthName'] = this.monthName;
    return data;
  }
}

class Attendance {
  String fullDate;
  String date;
  String day;
  String officeWorkingHours;
  String dayType;
  String dayText;
  String inTime;
  String outTime;
  var totalTime;
  var extraTime;
  String text;
  var adminAlert;
  var adminAlertMessage;
  int orignalTotalTime;
  bool isDayBeforeJoining;
  String extraTimeStatus;
  int secondsActualWorkingTime;
  int secondsActualWorkedTime;
  int secondsExtraTime;
  int officeTimeInside;

  Attendance(
      {this.fullDate,
      this.date,
      this.day,
      this.officeWorkingHours,
      this.dayType,
      this.dayText,
      this.inTime,
      this.outTime,
      this.totalTime,
      this.extraTime,
      this.text,
      this.adminAlert,
      this.adminAlertMessage,
      this.orignalTotalTime,
      this.isDayBeforeJoining,
      this.extraTimeStatus,
      this.secondsActualWorkingTime,
      this.secondsActualWorkedTime,
      this.secondsExtraTime,
      this.officeTimeInside});

  Attendance.fromJson(Map<String, dynamic> json) {
    fullDate = json['full_date'];
    date = json['date'];
    day = json['day'];
    officeWorkingHours = json['office_working_hours'];
    dayType = json['day_type'];
    dayText = json['day_text'];
    inTime = json['in_time'];
    outTime = json['out_time'];
    totalTime = json['total_time'];
    extraTime = json['extra_time'];
    text = json['text'];
    adminAlert = json['admin_alert'];
    adminAlertMessage = json['admin_alert_message'];
    orignalTotalTime = json['orignal_total_time'];
    isDayBeforeJoining = json['isDayBeforeJoining'];
    extraTimeStatus = json['extra_time_status'];
    secondsActualWorkingTime = json['seconds_actual_working_time'];
    secondsActualWorkedTime = json['seconds_actual_worked_time'];
    secondsExtraTime = json['seconds_extra_time'];
    officeTimeInside = json['office_time_inside'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_date'] = this.fullDate;
    data['date'] = this.date;
    data['day'] = this.day;
    data['office_working_hours'] = this.officeWorkingHours;
    data['day_type'] = this.dayType;
    data['day_text'] = this.dayText;
    data['in_time'] = this.inTime;
    data['out_time'] = this.outTime;
    data['total_time'] = this.totalTime;
    data['extra_time'] = this.extraTime;
    data['text'] = this.text;
    data['admin_alert'] = this.adminAlert;
    data['admin_alert_message'] = this.adminAlertMessage;
    data['orignal_total_time'] = this.orignalTotalTime;
    data['isDayBeforeJoining'] = this.isDayBeforeJoining;
    data['extra_time_status'] = this.extraTimeStatus;
    data['seconds_actual_working_time'] = this.secondsActualWorkingTime;
    data['seconds_actual_worked_time'] = this.secondsActualWorkedTime;
    data['seconds_extra_time'] = this.secondsExtraTime;
    data['office_time_inside'] = this.officeTimeInside;
    return data;
  }
}

class CompensationSummary {
  int secondsToBeCompensate;
  String timeToBeCompensate;
  List<CompensationBreakUp> compensationBreakUp;

  CompensationSummary(
      {this.secondsToBeCompensate,
      this.timeToBeCompensate,
      this.compensationBreakUp});

  CompensationSummary.fromJson(Map<String, dynamic> json) {
    secondsToBeCompensate = json['seconds_to_be_compensate'];
    timeToBeCompensate = json['time_to_be_compensate'];
    if (json['compensation_break_up'] != null) {
      compensationBreakUp = new List<CompensationBreakUp>();
      json['compensation_break_up'].forEach((v) {
        compensationBreakUp.add(new CompensationBreakUp.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seconds_to_be_compensate'] = this.secondsToBeCompensate;
    data['time_to_be_compensate'] = this.timeToBeCompensate;
    if (this.compensationBreakUp != null) {
      data['compensation_break_up'] =
          this.compensationBreakUp.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CompensationBreakUp {
  String text;

  CompensationBreakUp({this.text});

  CompensationBreakUp.fromJson(Map<String, dynamic> json) {
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    return data;
  }
}
