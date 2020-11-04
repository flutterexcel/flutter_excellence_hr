import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'logintest/login_success.dart';
import 'myprofile_test.dart';
import 'navigationlist_tets.dart';

void we() {
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
    navigationListTest(driver);
    myProfileTest(driver);
  });
}
