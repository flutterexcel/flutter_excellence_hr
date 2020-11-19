import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void applyLeaveTest(FlutterDriver driver) {
  group('test Apply leave page', () {
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
      await driver.waitFor(find.text('Apply Leave'));
            driver.tap(find.text('Apply Leave'));
    });

    test('check apply leave screen/', () async {
      await driver.waitFor(find.text('Leave Summary'));
    });

    test('check for apply date from 1', () async {
      await driver.waitFor(find.byValueKey('fromDateKey'));
      driver.tap(find.byValueKey('fromDateKey'));
      await driver.tap(find.text('1'));
      await driver.tap(find.text('OK'));

    });

    test('check apply date to 3', () async {
      await driver.waitFor(find.byValueKey('toDateKey'));
      driver.tap(find.byValueKey('toDateKey'));
      await driver.tap(find.text('3'));
      await driver.tap(find.text('OK'));
    });

    test('select leave option casual', () async {
      await driver.waitFor(find.text('Leave Option'));
      driver.tap(find.text('Leave Option'));
      await driver.tap(find.text('Casual'));
    });

    test('check input reason for leave/', () async {
      await driver.waitFor(find.byValueKey('reasonKey'));
            driver.tap(find.byValueKey('reasonKey'));
            driver.enterText('FOR TESTING');
    });

    test('check button for apply leave', ()async{

      await driver.waitFor(find.byType("RoundedLoadingButton"));
            driver.tap(find.byType("RoundedLoadingButton"));
    });
  });
}
