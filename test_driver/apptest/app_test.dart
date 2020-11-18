import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import '../applyleavetest.dart';
import '../attendancetest.dart';
import '../documenttest.dart';
import '../inventorytest.dart';
import '../leavetest.dart';
import '../logintest.dart';
import '../logouttest.dart';
import '../profiletest.dart';
import '../salarytest.dart';

void main() {
  FlutterDriver driver;

  group('check app flow/', () {
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });
    loginTest(driver);
    profileTest(driver);
    loginTest(driver);
    attendancetest(driver);
    applyLeaveTest(driver);
    leaveTest(driver);
    salaryTest(driver);
    inventorytest(driver);
    documentTest(driver);
    logOut(driver);
  });
}
