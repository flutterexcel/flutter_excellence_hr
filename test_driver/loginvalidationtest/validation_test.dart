import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

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

    test('check login validations with empty inputs/', () async {
      await driver.tap(find.text('Login'));
      await Future.delayed(Duration(seconds: 2));
      await driver.waitFor(find.text('Please enter username'));
    });

    test('check login with one empty input/', () async {
      await driver.tap(find.byValueKey('Username'));
      await driver.enterText('kartikjabreba');
      await Future.delayed(Duration(seconds: 2));
      await driver.tap(find.text('Login'));
      await Future.delayed(Duration(seconds: 2));
      await driver.waitFor(find.text('Please enter password'));
    });
  });
}
