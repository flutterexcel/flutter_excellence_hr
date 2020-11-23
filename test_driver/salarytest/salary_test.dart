import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import '../logintest.dart';
import '../salarytest.dart';

void main() {
  FlutterDriver driver;
  group('check salary page/', () {
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });
    loginTest(driver);
    salaryTest(driver);
  });
}
