import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void loginSuccess(FlutterDriver driver) {
  group('Login Test/', () {
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Form Fill/', () async {
      await driver.tap(find.byValueKey('Username'));
      await driver.enterText('kartikjabreba');
      await Future.delayed(Duration(seconds: 2));
      await driver.tap(find.byValueKey('Password'));
      await driver.enterText('CMJ97');
      await Future.delayed(Duration(seconds: 2));
    });

    test('Login Button Press/', () async {
      await driver.tap(find.text('Login'));
      await Future.delayed(Duration(seconds: 2));
    });

  });
}
