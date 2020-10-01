class Holiday {
  int error;
  Data data;

  Holiday({this.error, this.data});

  Holiday.fromJson(Map<String, dynamic> json) {
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
  String message;
  List<Holidays> holidays;

  Data({this.message, this.holidays});

  Data.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['holidays'] != null) {
      holidays = new List<Holidays>();
      json['holidays'].forEach((v) {
        holidays.add(new Holidays.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.holidays != null) {
      data['holidays'] = this.holidays.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Holidays {
  String id;
  String name;
  String date;
  String type;
  String typeText;
  String month;
  String dayOfWeek;

  Holidays(
      {this.id,
      this.name,
      this.date,
      this.type,
      this.typeText,
      this.month,
      this.dayOfWeek});

  Holidays.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    date = json['date'];
    type = json['type'];
    typeText = json['type_text'];
    month = json['month'];
    dayOfWeek = json['dayOfWeek'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['date'] = this.date;
    data['type'] = this.type;
    data['type_text'] = this.typeText;
    data['month'] = this.month;
    data['dayOfWeek'] = this.dayOfWeek;
    return data;
  }
}
