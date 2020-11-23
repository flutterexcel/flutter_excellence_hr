import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void forgotPasswordTest(FlutterDriver driver) {
  group('check forgotpassword/', () {
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });
    test('check forget button press/', () async {
      await driver.tap(find.text('Forget password'));
    });

    test('check forget screen/', () async {
      await driver.tap(find.byValueKey('ResetPassword'));
      await driver.enterText('TestUser');
      await driver.tap(find.text('Reset Password'));
    });

    test('for user Login screen', () async {
      await driver.scrollIntoView(find.text('Login'));
      driver.tap(find.text('Login'));
      await driver.scrollIntoView(find.text('Login'));
      
    });
  });
}
