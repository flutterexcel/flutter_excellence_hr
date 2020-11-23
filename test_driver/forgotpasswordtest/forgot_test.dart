import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import '../forgotPasswordTest.dart';

void main() {
  group('check forgotpassword/', () {
    FlutterDriver driver;
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });
    forgotPasswordTest(driver);
  });
}
