import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
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
    test('Forget Button Press/', () async {
      await driver.tap(find.text('Forget password'));
    });

    test('Forget Screen/', () async {
      await driver.tap(find.text('Username'));
      await driver.enterText('shakti');
      await driver.tap(find.text('Reset Password'));
    });

    test('Login Button Press', () async {
      await driver.tap(find.text('Login'));
      });

    
      });
}
