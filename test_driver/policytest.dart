import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void policyTest(FlutterDriver driver){
  group('check policy page/', (){
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
      await driver.waitFor(find.text('Policy Documents'));
      await driver.tap(find.text('Policy Documents'));
    });

    test('test policy documnets screen/', ()async{
      final SerializableFinder policyHeader =
          find.text('Policy Documents directory');
      await driver.waitFor(policyHeader);

    });
  });
}