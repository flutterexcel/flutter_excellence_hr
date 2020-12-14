class TimeSheet {
  int _error;
  List<Data> _data;

  TimeSheet({int error, List<Data> data}) {
    this._error = error;
    this._data = data;
  }

  int get error => _error;
  set error(int error) => _error = error;
  List<Data> get data => _data;
  set data(List<Data> data) => _data = data;

  TimeSheet.fromJson(Map<String, dynamic> json) {
    _error = json['error'];
    if (json['data'] != null) {
      _data = new List<Data>();
      json['data'].forEach((v) {
        _data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this._error;
    if (this._data != null) {
      data['data'] = this._data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String _fullDate;
  String _date;
  String _day;
  String _officeWorkingHours;
  String _dayType;
  String _dayText;
  String _inTime;
  String _outTime;
  int _totalTime;
  int _extraTime;
  String _text;
  String _adminAlert;
  String _adminAlertMessage;
  int _orignalTotalTime;
  String _extraTimeStatus;
  int _secondsActualWorkingTime;
  int _secondsActualWorkedTime;
  int _secondsExtraTime;
  int _officeTimeInside;
  String _userid;
  String _username;
  int _totalHours;
  String _comments;
  String _status;
  String _fileId;
  String _file;

  Data(
      {String fullDate,
      String date,
      String day,
      String officeWorkingHours,
      String dayType,
      String dayText,
      String inTime,
      String outTime,
      int totalTime,
      int extraTime,
      String text,
      String adminAlert,
      String adminAlertMessage,
      int orignalTotalTime,
      String extraTimeStatus,
      int secondsActualWorkingTime,
      int secondsActualWorkedTime,
      int secondsExtraTime,
      int officeTimeInside,
      String userid,
      String username,
      int totalHours,
      String comments,
      String status,
      String fileId,
      String file}) {
    this._fullDate = fullDate;
    this._date = date;
    this._day = day;
    this._officeWorkingHours = officeWorkingHours;
    this._dayType = dayType;
    this._dayText = dayText;
    this._inTime = inTime;
    this._outTime = outTime;
    this._totalTime = totalTime;
    this._extraTime = extraTime;
    this._text = text;
    this._adminAlert = adminAlert;
    this._adminAlertMessage = adminAlertMessage;
    this._orignalTotalTime = orignalTotalTime;
    this._extraTimeStatus = extraTimeStatus;
    this._secondsActualWorkingTime = secondsActualWorkingTime;
    this._secondsActualWorkedTime = secondsActualWorkedTime;
    this._secondsExtraTime = secondsExtraTime;
    this._officeTimeInside = officeTimeInside;
    this._userid = userid;
    this._username = username;
    this._totalHours = totalHours;
    this._comments = comments;
    this._status = status;
    this._fileId = fileId;
    this._file = file;
  }

  String get fullDate => _fullDate;
  set fullDate(String fullDate) => _fullDate = fullDate;
  String get date => _date;
  set date(String date) => _date = date;
  String get day => _day;
  set day(String day) => _day = day;
  String get officeWorkingHours => _officeWorkingHours;
  set officeWorkingHours(String officeWorkingHours) =>
      _officeWorkingHours = officeWorkingHours;
  String get dayType => _dayType;
  set dayType(String dayType) => _dayType = dayType;
  String get dayText => _dayText;
  set dayText(String dayText) => _dayText = dayText;
  String get inTime => _inTime;
  set inTime(String inTime) => _inTime = inTime;
  String get outTime => _outTime;
  set outTime(String outTime) => _outTime = outTime;
  int get totalTime => _totalTime;
  set totalTime(int totalTime) => _totalTime = totalTime;
  int get extraTime => _extraTime;
  set extraTime(int extraTime) => _extraTime = extraTime;
  String get text => _text;
  set text(String text) => _text = text;
  String get adminAlert => _adminAlert;
  set adminAlert(String adminAlert) => _adminAlert = adminAlert;
  String get adminAlertMessage => _adminAlertMessage;
  set adminAlertMessage(String adminAlertMessage) =>
      _adminAlertMessage = adminAlertMessage;
  int get orignalTotalTime => _orignalTotalTime;
  set orignalTotalTime(int orignalTotalTime) =>
      _orignalTotalTime = orignalTotalTime;
  String get extraTimeStatus => _extraTimeStatus;
  set extraTimeStatus(String extraTimeStatus) =>
      _extraTimeStatus = extraTimeStatus;
  int get secondsActualWorkingTime => _secondsActualWorkingTime;
  set secondsActualWorkingTime(int secondsActualWorkingTime) =>
      _secondsActualWorkingTime = secondsActualWorkingTime;
  int get secondsActualWorkedTime => _secondsActualWorkedTime;
  set secondsActualWorkedTime(int secondsActualWorkedTime) =>
      _secondsActualWorkedTime = secondsActualWorkedTime;
  int get secondsExtraTime => _secondsExtraTime;
  set secondsExtraTime(int secondsExtraTime) =>
      _secondsExtraTime = secondsExtraTime;
  int get officeTimeInside => _officeTimeInside;
  set officeTimeInside(int officeTimeInside) =>
      _officeTimeInside = officeTimeInside;
  String get userid => _userid;
  set userid(String userid) => _userid = userid;
  String get username => _username;
  set username(String username) => _username = username;
  int get totalHours => _totalHours;
  set totalHours(int totalHours) => _totalHours = totalHours;
  String get comments => _comments;
  set comments(String comments) => _comments = comments;
  String get status => _status;
  set status(String status) => _status = status;
  String get fileId => _fileId;
  set fileId(String fileId) => _fileId = fileId;
  String get file => _file;
  set file(String file) => _file = file;

  Data.fromJson(Map<String, dynamic> json) {
    _fullDate = json['full_date'];
    _date = json['date'];
    _day = json['day'];
    _officeWorkingHours = json['office_working_hours'];
    _dayType = json['day_type'];
    _dayText = json['day_text'];
    _inTime = json['in_time'];
    _outTime = json['out_time'];
    _totalTime = json['total_time'];
    _extraTime = json['extra_time'];
    _text = json['text'];
    _adminAlert = json['admin_alert'];
    _adminAlertMessage = json['admin_alert_message'];
    _orignalTotalTime = json['orignal_total_time'];
    _extraTimeStatus = json['extra_time_status'];
    _secondsActualWorkingTime = json['seconds_actual_working_time'];
    _secondsActualWorkedTime = json['seconds_actual_worked_time'];
    _secondsExtraTime = json['seconds_extra_time'];
    _officeTimeInside = json['office_time_inside'];
    _userid = json['userid'];
    _username = json['username'];
    _totalHours = json['total_hours'];
    _comments = json['comments'];
    _status = json['status'];
    _fileId = json['fileId'];
    _file = json['file'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_date'] = this._fullDate;
    data['date'] = this._date;
    data['day'] = this._day;
    data['office_working_hours'] = this._officeWorkingHours;
    data['day_type'] = this._dayType;
    data['day_text'] = this._dayText;
    data['in_time'] = this._inTime;
    data['out_time'] = this._outTime;
    data['total_time'] = this._totalTime;
    data['extra_time'] = this._extraTime;
    data['text'] = this._text;
    data['admin_alert'] = this._adminAlert;
    data['admin_alert_message'] = this._adminAlertMessage;
    data['orignal_total_time'] = this._orignalTotalTime;
    data['extra_time_status'] = this._extraTimeStatus;
    data['seconds_actual_working_time'] = this._secondsActualWorkingTime;
    data['seconds_actual_worked_time'] = this._secondsActualWorkedTime;
    data['seconds_extra_time'] = this._secondsExtraTime;
    data['office_time_inside'] = this._officeTimeInside;
    data['userid'] = this._userid;
    data['username'] = this._username;
    data['total_hours'] = this._totalHours;
    data['comments'] = this._comments;
    data['status'] = this._status;
    data['fileId'] = this._fileId;
    data['file'] = this._file;
    return data;
  }
}
