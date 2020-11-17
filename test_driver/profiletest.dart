import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void profileTest(FlutterDriver driver) {
  group('check profile/', () {
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });
    test('tap naviagation drawer/', () async {
      final SerializableFinder locateDrawer =
          find.byTooltip('Open navigation menu');
      await driver.tap(locateDrawer);
      await driver.waitFor(find.text('My Profile'));
    });

    test('tap my profile/', () async {
      await driver.tap(find.text('My Profile'));
      await driver.waitFor(find.text('kartikjabreba'));
    });

    test('check for update bank detail/', () async {
      await driver.scrollIntoView(find.byValueKey('BankAccountNumber'));
      await driver.tap(find.byValueKey('BankAccountNumber'));
      await driver.enterText('123412341234');
      await driver.scrollIntoView(find.byValueKey('BankName'));
      await driver.tap(find.byValueKey('BankName'));
      await driver.enterText('ICICI Bank');
      await driver.scrollIntoView(find.byValueKey('IfscCode'));
      await driver.tap(find.byValueKey('IfscCode'));
      await driver.enterText('ICICI2020');
      await driver.scrollIntoView(find.text('Update Bank Details'));
      await driver.tap(find.text('Update Bank Details'));
    });

    test('update password/', () async {
      await driver.scrollIntoView(find.byValueKey('updatePassword'));
      await driver.tap(find.byValueKey('updatePassword'));
      await driver.enterText('abcd');
      await driver.scrollIntoView(find.byValueKey('update'));
      await driver.tap(find.byValueKey('update'));
    });
      
      test('switch loginscreen after update password/', () async {
        await driver.waitFor(find.text('Login'));
      });
    });
}