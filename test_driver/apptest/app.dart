import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_excellence_hr/globals.dart';
import 'package:flutter_excellence_hr/main.dart'as app;

void main() {
  enableFlutterDriverExtension();
  testingActive = true;
  app.main();
}