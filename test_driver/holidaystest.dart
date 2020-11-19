import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void holidaysTest(FlutterDriver driver) {
  group('check holidays page/', () {
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
       driver.tap(locateDrawer);
      await driver.waitFor(find.text('Holidays'));
       driver.tap(find.text('Holidays'));
    });

    test('check year change function from 2020 to 2019', () async {
      await driver.waitFor(find.text('2020'));
      driver.tap(find.text('2020'));
      await driver.tap(find.text('2019'));
      await driver.waitFor(find.text('Holiday 2019'));
    });
  });
}
