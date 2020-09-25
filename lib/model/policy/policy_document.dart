class PolicyDocument {
  int error;
  List<Data> data;

  PolicyDocument({this.error, this.data});

  PolicyDocument.fromJson(Map<String, dynamic> json) {
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
  String name;
  String link;
  int read;
  int updatedTime;
  bool mandatory;

  Data({this.name, this.link, this.read, this.updatedTime, this.mandatory});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    link = json['link'];
    read = json['read'];
    updatedTime = json['updated_time'];
    mandatory = json['mandatory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['link'] = this.link;
    data['read'] = this.read;
    data['updated_time'] = this.updatedTime;
    data['mandatory'] = this.mandatory;
    return data;
  }
}
