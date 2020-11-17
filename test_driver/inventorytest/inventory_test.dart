import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import '../inventorytest.dart';
import '../logintest.dart';

void main() {
  FlutterDriver driver;
  group('check inventory page/', () {
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });
    loginTest(driver);
    inventorytest(driver);
  });
}
