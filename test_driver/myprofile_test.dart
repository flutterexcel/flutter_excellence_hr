import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void myProfileTest(FlutterDriver driver) {
  group('My Profile/', () {
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Check Profile Page', () async {
      await driver.waitFor(find.text('kartikjabreba'));
    });
  });
}
