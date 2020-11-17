import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import '../attendancetest.dart';
import '../logintest.dart';

void main() {
  FlutterDriver driver;
  group('check attendance page/', () {
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });
    loginTest(driver);
    attendancetest(driver);
  });
}
