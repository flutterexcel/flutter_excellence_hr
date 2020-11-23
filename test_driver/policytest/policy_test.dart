import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import '../logintest.dart';
import '../policytest.dart';

void main() {
  FlutterDriver driver;

  group('check policy page/', () {
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });
    loginTest(driver);
    policyTest(driver);
  });
}
