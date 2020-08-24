class User {
  String _username;
  String _password;
  String token;
  String message;
  String userid;
  User(this._username, this._password);

  User.map(dynamic obj) {
    //print(obj);
    this._username = obj["username"];
    this._password = obj["password"];
    this.token = obj["data"]["token"];
    this.message = obj["data"]["message"];
    this.userid = obj["data"]["userid"];
  }

  String get username => _username;
  String get password => _password;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["username"] = _username;
    map["password"] = _password;
    map["token"] = token;
    map["message"] = message;
    map["userid"] = userid;
    return map;
  }
}
