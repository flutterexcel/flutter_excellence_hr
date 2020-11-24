import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import '../holidaystest.dart';
import '../logintest.dart';

void main() {
  FlutterDriver driver;
  group('check holidays page/', () {
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });
    loginTest(driver);
    holidaysTest(driver);
  });
}
