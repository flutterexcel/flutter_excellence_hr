import 'dart:math';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void attendancetest(FlutterDriver driver) {
  group('check attendance page/', () {
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
      await driver.waitFor(find.text('My Attendance'));
            driver.tap(find.text('My Attendance'));
    });

    test('naviagate to attendance page/ ', () async {
      await driver.waitFor(find.text('Kartik Jabreba'));
    });

    test('tap for manual attendance/', () async {
      final itemFinder = find.text('04');
      final listFinder = find.byValueKey('leavekey');
      await driver.scrollUntilVisible(listFinder, itemFinder, dyScroll: -100.0);
      expect(await driver.getText(itemFinder), '04');
    });

    test('apply for manual attendance/', () async {
      await driver.tap(find.byValueKey('3'));
      driver.waitFor(find.text('Your Day Summary'));
    });

    test('apply for entry time', () async {
      await driver.waitFor(find.byValueKey('entryTimeKey'));
      driver.tap(find.byValueKey('entryTimeKey'));
      await driver.waitFor(find.byType("DateTimeField"));
      driver.tap(find.text('10'));
      driver.tap(find.text('OK'));
    });

    test('apply for exit time', () async {
      await driver.waitFor(find.byValueKey('exitTimeKey'));
      driver.tap(find.byValueKey('exitTimeKey'));
      await driver.waitFor(find.byType("DateTimeField"));
      driver.tap(find.text('08'));
      driver.tap(find.text('OK'));
    });

    test('enter reason', () async {
      await driver.waitFor(find.byValueKey('reasonKey'));
      driver.tap(find.byValueKey('reasonKey'));
      driver.enterText('FOR TESTING');
    });

    test('apply leave button press', () async {
      await driver.scrollIntoView(find.text('Update'));
      driver.tap(find.text('Update'));
    });
  });
}
