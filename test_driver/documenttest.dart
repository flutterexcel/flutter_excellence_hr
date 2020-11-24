import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void documentTest(FlutterDriver driver) {
  group('check my document page/', () {
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
      await driver.waitFor(find.text('My Documents'));
       driver.tap(find.text('My Documents'));
    });

    test('test navigate to My Documents page', () async {
      final SerializableFinder myDocumentsHeader = find.text('My Documents');
      await driver.waitFor(myDocumentsHeader);
    });

    test('check document type to upload', () async {
      await driver.waitFor(find.text('Appointment Letter'));
      driver.tap(find.text('Appointment Letter'));
      await driver.tap(find.text('CV'));
    });

    test('check for document list', () async {
      await driver.waitFor(find.text('PAN Card'));
    });
  });
}
