import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void salaryTest(FlutterDriver driver) {
  group('check salary page/', () {
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
      await driver.waitFor(find.text('My Salary'));
       driver.tap(find.text('My Salary'));
    });
    test('check my slary page/', () async {
      final SerializableFinder salaryPageHeader = find.text('My Salary');
      await driver.waitFor(salaryPageHeader);
    });
  });
}
