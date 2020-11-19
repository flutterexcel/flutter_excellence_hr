import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void loginTest(FlutterDriver driver) {

  group('check login success using valid inputs/', () {
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });
    test('check form Fill/', () async {
      await driver.tap(find.byValueKey('Username'));
       driver.enterText('kartikjabreba');
      await driver.tap(find.byValueKey('Password'));
       driver.enterText('CMJ97');
      await driver.tap(find.text('Login'));

    });

    test('check inventory page after login button press/', ()async{
      await driver.waitFor(find.text('Inventory'));
    });
  });
}
