import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void leaveTest(FlutterDriver driver) {
  group('check my leave page/', () {
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
      await driver.tap(find.text('My Leaves'));
    });

    test('check leave page/', () async {
      await driver.waitFor(find.text('Allocated Leaves'));
    });
    test('check for upload documents', () async {
      await driver.scrollIntoView(find.text('Sick Leave'));
      await driver.waitFor(find.byType("RaisedButton"));
      driver.tap(find.byType("RaisedButton"));
      //await driver.tap(find.byValueKey('uploadDocumentKey'));
    });
  });
}
