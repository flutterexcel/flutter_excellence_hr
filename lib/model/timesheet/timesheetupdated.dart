class TimeSheetUpdated {
  int error;
  String message;

  TimeSheetUpdated({this.error, this.message});

  TimeSheetUpdated.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['message'] = this.message;
    return data;
  }
}