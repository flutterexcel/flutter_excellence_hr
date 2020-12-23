class LeaveDate {
  int error;
  Data data;

  LeaveDate({this.error, this.data});

  LeaveDate.fromJson(Map<String, dynamic> json) {
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
  String startDate;
  String endDate;
  int workingDays;
  int holidays;
  int weekends;
  List<Days> days;
  String message;

  Data(
      {this.startDate,
      this.endDate,
      this.workingDays,
      this.holidays,
      this.weekends,
      this.days,
      this.message});

  Data.fromJson(Map<String, dynamic> json) {
    startDate = json['start_date'];
    endDate = json['end_date'];
    workingDays = json['working_days'];
    holidays = json['holidays'];
    weekends = json['weekends'];
    if (json['days'] != null) {
      days = new List<Days>();
      json['days'].forEach((v) {
        days.add(new Days.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['working_days'] = this.workingDays;
    data['holidays'] = this.holidays;
    data['weekends'] = this.weekends;
    if (this.days != null) {
      data['days'] = this.days.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Days {
  String type;
  String subType;
  String subSubType;
  String fullDate;
  String date;

  Days({this.type, this.subType, this.subSubType, this.fullDate, this.date});

  Days.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    subType = json['sub_type'];
    subSubType = json['sub_sub_type'];
    fullDate = json['full_date'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['sub_type'] = this.subType;
    data['sub_sub_type'] = this.subSubType;
    data['full_date'] = this.fullDate;
    data['date'] = this.date;
    return data;
  }
}
