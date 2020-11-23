import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void loginValidationTest(FlutterDriver driver) {
  group('check login validations /', () {
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('check validation with empty inputs', () async {
      await driver.tap(find.text('Login'));
      await driver.waitFor(find.text('Please enter username'));
    });

    test('check validation with one empty field', () async {
      await driver.tap(find.byValueKey('Username'));
      driver.enterText('Test User');
      await driver.tap(find.text('Login'));
      await driver.waitFor(find.text('Please enter password'));
    });
  });
}
