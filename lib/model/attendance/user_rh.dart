class UserRh {
  int error;
  List<Data> data;

  UserRh({this.error, this.data});

  UserRh.fromJson(Map<String, dynamic> json) {
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
  String id;
  String name;
  String date;
  String type;
  String typeText;
  String rawDate;
  String day;
  String month;

  Data(
      {this.id,
      this.name,
      this.date,
      this.type,
      this.typeText,
      this.rawDate,
      this.day,
      this.month});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    date = json['date'];
    type = json['type'];
    typeText = json['type_text'];
    rawDate = json['raw_date'];
    day = json['day'];
    month = json['month'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['date'] = this.date;
    data['type'] = this.type;
    data['type_text'] = this.typeText;
    data['raw_date'] = this.rawDate;
    data['day'] = this.day;
    data['month'] = this.month;
    return data;
  }
}
