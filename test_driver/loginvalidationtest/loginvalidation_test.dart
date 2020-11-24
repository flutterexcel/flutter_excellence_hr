import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import '../loginvalidationtest.dart';

void main() {
  FlutterDriver driver;
  group('check login validations/', () {
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });
    loginValidationTest(driver);
  });
}
