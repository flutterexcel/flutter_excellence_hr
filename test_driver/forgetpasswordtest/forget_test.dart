import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

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
    test('check forget button press/', () async {
      await driver.tap(find.text('Forget password'));
    });

    test('check forget screen/', () async {
      await driver.tap(find.byValueKey('ResetPassword'));
      await driver.enterText('shakti');
      await driver.tap(find.text('Reset Password'));
    });
  });
}
