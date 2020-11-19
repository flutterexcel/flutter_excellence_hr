import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void logOut(FlutterDriver driver) {
  group('check logout /', () {
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
      await driver.tap(find.text('Logout'));
    });

    test('login screen/', () async {
      await driver.waitFor(find.text('Login'));
    });
  });
}
