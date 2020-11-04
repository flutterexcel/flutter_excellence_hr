import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void forgotPassword() {
  FlutterDriver driver;
  group('Forgot Password', () {
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Tap Forgot Password', () async {
      await driver.tap(find.text('Forget password'));
    });

    test('Reset Password Screen', ()async {
      await driver.waitFor(find.text('Reset Your Password'));
    });
  });
}
