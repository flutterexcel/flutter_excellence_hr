import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_excellence_hr/main.dart' as login;

void main() async {
  
  // ignore: missing_return
  Future<String> dataHandler(String msg) async {}
 enableFlutterDriverExtension(handler: dataHandler);
  login.main();
}