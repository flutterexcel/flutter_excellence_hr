import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import '../forgettest.dart';

void main() {
  group('check forgetpassword/', () {
    FlutterDriver driver;
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });
    forgettest(driver);
  });
}
