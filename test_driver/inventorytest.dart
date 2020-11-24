import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void inventorytest(FlutterDriver driver) {
  group('check inventory page/', () {
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('switch to inventory/', () async {
      final SerializableFinder locateDrawer =
          find.byTooltip('Open navigation menu');
       driver.tap(locateDrawer);
      await driver.tap(find.text('My Inventory'));
      await driver.waitFor(find.text('Acer'));
    });
    
  });
}
