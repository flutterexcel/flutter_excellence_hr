class AuditCurrentMonthStatus {
  String year;
  String month;
  bool status;

  AuditCurrentMonthStatus({this.year, this.month, this.status});

  AuditCurrentMonthStatus.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    month = json['month'];
    status = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['year'] = this.year;
    data['month'] = this.month;
    data['status'] = this.status;
    return data;
  }
}
