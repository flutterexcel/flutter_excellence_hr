import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void navigationListTest(FlutterDriver driver) {
  group('Navigation List/', () {
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Drawer Open/', () async {
      final SerializableFinder locateDrawer =
          find.byTooltip('Open navigation menu');
      await driver.tap(locateDrawer);
      await driver.waitFor(find.text('My Profile'));
    });
  });
}
