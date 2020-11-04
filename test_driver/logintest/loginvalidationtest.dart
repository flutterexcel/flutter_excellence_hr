import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void loginValidation(FlutterDriver driver) {
  
  group('Login Test/', () {
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Logout App/', ()async{
      final SerializableFinder locateDrawer =
          find.byTooltip('Open navigation menu');
      await driver.tap(locateDrawer);
      await driver.tap(find.text('Logout'));
      await Future.delayed(Duration(seconds: 2));
    });

    test('Form Fill Empty/', () async {
      await driver.tap(find.byValueKey('Username'));
      await driver.enterText('');
      await Future.delayed(Duration(seconds: 2));
      await driver.tap(find.byValueKey('Password'));
      await driver.enterText('');
      await Future.delayed(Duration(seconds: 2));
    });

    test('Login Button Press/', () async {
      await driver.tap(find.text('Login'));
      await Future.delayed(Duration(seconds: 2));
      await driver.waitFor(find.text('Please enter'));
    });

    test('Form Fill Empty Password/', () async {
      await driver.tap(find.byValueKey('Username'));
      await driver.enterText('kartikjabreba');
      await Future.delayed(Duration(seconds: 2));
      await driver.tap(find.byValueKey('Password'));
      await driver.enterText('');
      await Future.delayed(Duration(seconds: 2));
    });

    test('Login Button Press/', () async {
      await driver.tap(find.text('Login'));
      await Future.delayed(Duration(seconds: 2));
      await driver.waitFor(find.text('Please enter password'));
    });

    test('Form Fill Empty Username/', () async {
      await driver.tap(find.byValueKey('Username'));
      await driver.enterText('');
      await Future.delayed(Duration(seconds: 2));
      await driver.tap(find.byValueKey('Password'));
      await driver.enterText('CMJ97');
      await Future.delayed(Duration(seconds: 2));
    });

    test('Login Button Press/', () async {
      await driver.tap(find.text('Login'));
      await Future.delayed(Duration(seconds: 2));
      await driver.waitFor(find.text('Please enter email'));
    });
  });
}
