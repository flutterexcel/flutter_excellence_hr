import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  FlutterDriver driver;

  group('check login fail using valid inputs/', () {
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });
    test('enter valid data for login fail', () async {
      await driver.tap(find.byValueKey('Username'));
      driver.enterText('kartikjabreba');
      await driver.tap(find.byValueKey('Password'));
      driver.enterText('CMJ97');
    });

    test('check login fail message', () async {
      await driver.tap(find.text('Login'));
      await driver.waitFor(find.byType("SnackBar"));
      await Future.delayed(const Duration(seconds: 3));
      driver.waitFor(find.text('Invalid'));
    });
  });
}
