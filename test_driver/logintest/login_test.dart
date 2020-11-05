import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'login_success.dart';

void main() {
  group('Hr App/', () {
    FlutterDriver driver;
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    loginSuccess(driver);
  });
}
