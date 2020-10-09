class GetRhLeaves {
  int error;
  Data data;

  GetRhLeaves({this.error, this.data});

  GetRhLeaves.fromJson(Map<String, dynamic> json) {
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
  List<RhList> rhList;

  Data({this.rhList});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['rh_list'] != null) {
      rhList = new List<RhList>();
      json['rh_list'].forEach((v) {
        rhList.add(new RhList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rhList != null) {
      data['rh_list'] = this.rhList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RhList {
  String id;
  String name;
  String date;
  String type;
  String typeText;
  String rawDate;
  String day;
  String month;
  String status;

  RhList(
      {this.id,
      this.name,
      this.date,
      this.type,
      this.typeText,
      this.rawDate,
      this.day,
      this.month,
      this.status});

  RhList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    date = json['date'];
    type = json['type'];
    typeText = json['type_text'];
    rawDate = json['raw_date'];
    day = json['day'];
    month = json['month'];
    status = json['status'];
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
    data['status'] = this.status;
    return data;
  }
}
