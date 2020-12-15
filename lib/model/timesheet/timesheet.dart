class TimeSheet {
  int error;
  List<Data> data;

  TimeSheet({this.error, this.data});

  TimeSheet.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String fullDate;
  String date;
  String day;
  String officeWorkingHours;
  String dayType;
  // String dayText;
  // String inTime;
  // String outTime;
  // int totalTime;
  // int extraTime;
  // String text;
  var adminAlert;
  // String adminAlertMessage;
  // int orignalTotalTime;
  // String extraTimeStatus;
  // int secondsActualWorkingTime;
  // int secondsActualWorkedTime;
  // int secondsExtraTime;
  // int officeTimeInside;
  String userid;
  String username;
  int totalHours;
  // String comments;
  // String status;
  // String fileId;
  // String file;

  Data({
    this.fullDate,
    this.date,
    this.day,
    this.officeWorkingHours,
    this.dayType,
    // this.dayText,
    // this.inTime,
    // this.outTime,
    // this.totalTime,
    // this.extraTime,
    // this.text,
    this.adminAlert,
    // this.adminAlertMessage,
    // this.orignalTotalTime,
    // this.extraTimeStatus,
    // this.secondsActualWorkingTime,
    // this.secondsActualWorkedTime,
    // this.secondsExtraTime,
    // this.officeTimeInside,
    this.userid,
    this.username,
    this.totalHours,
    // this.comments,
    // this.status,
    // this.fileId,
    // this.file
  });

  Data.fromJson(Map<String, dynamic> json) {
    fullDate = json['full_date'];
    date = json['date'];
    day = json['day'];
    officeWorkingHours = json['office_working_hours'];
    dayType = json['day_type'];
    // dayText = json['day_text'];
    // inTime = json['in_time'];
    // outTime = json['out_time'];
    // totalTime = json['total_time'];
    // extraTime = json['extra_time'];
    // text = json['text'];
    adminAlert = json['admin_alert'];
    // adminAlertMessage = json['admin_alert_message'];
    // orignalTotalTime = json['orignal_total_time'];
    // extraTimeStatus = json['extra_time_status'];
    // secondsActualWorkingTime = json['seconds_actual_working_time'];
    // secondsActualWorkedTime = json['seconds_actual_worked_time'];
    // secondsExtraTime = json['seconds_extra_time'];
    // officeTimeInside = json['office_time_inside'];
    userid = json['userid'];
    username = json['username'];
    totalHours = json['total_hours'];
    // comments = json['comments'];
    // status = json['status'];
    // fileId = json['fileId'];
    // file = json['file'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_date'] = this.fullDate;
    data['date'] = this.date;
    data['day'] = this.day;
    data['office_working_hours'] = this.officeWorkingHours;
    data['day_type'] = this.dayType;
    // data['day_text'] = this.dayText;
    // data['in_time'] = this.inTime;
    // data['out_time'] = this.outTime;
    // data['total_time'] = this.totalTime;
    // data['extra_time'] = this.extraTime;
    // data['text'] = this.text;
    data['admin_alert'] = this.adminAlert;
    // data['admin_alert_message'] = this.adminAlertMessage;
    // data['orignal_total_time'] = this.orignalTotalTime;
    // data['extra_time_status'] = this.extraTimeStatus;
    // data['seconds_actual_working_time'] = this.secondsActualWorkingTime;
    // data['seconds_actual_worked_time'] = this.secondsActualWorkedTime;
    // data['seconds_extra_time'] = this.secondsExtraTime;
    // data['office_time_inside'] = this.officeTimeInside;
    data['userid'] = this.userid;
    data['username'] = this.username;
    data['total_hours'] = this.totalHours;
    // data['comments'] = this.comments;
    // data['status'] = this.status;
    // data['fileId'] = this.fileId;
    // data['file'] = this.file;
    return data;
  }
}
