import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_excellence_hr/dependencyassembler.dart';
import 'package:flutter_excellence_hr/model/user.dart';
import 'package:flutter_excellence_hr/services/authentication_services.dart';
import 'package:flutter_excellence_hr/services/login.dart';
import 'package:flutter_excellence_hr/services/storage_service.dart';
import 'package:test/test.dart';

class MockLogin extends Login {
  @override
  Future<User> login(String username, String password) {
    StorageUtil.setUserToken('eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjU0MCIsInVzZXJuYW1lIjoia2FydGlramFicmViYSIsInJvbGUiOiJFbXBsb3llZSIsIm5hbWUiOiJLYXJ0aWsgSmFicmViYSIsImpvYnRpdGxlIjoiSnIuIE1vYmlsZSBBcHAgRGV2ZWxvcGVyIiwicHJvZmlsZUltYWdlIjoiaHR0cHM6XC9cL2F2YXRhcnMuc2xhY2stZWRnZS5jb21cLzIwMjAtMDktMjhcLzEzNzY3NTM0ODIxOTlfMzIyNTZlYWY4ZTUyODc0OTU2MThfb3JpZ2luYWwuanBnIiwibG9naW5fdGltZSI6MTYwNDY2MDQ3MCwibG9naW5fZGF0ZV90aW1lIjoiMDYtTm92LTIwMjAgMTY6MzE6MTAiLCJldGhfdG9rZW4iOm51bGwsInJvbGVfcGFnZXMiOlt7ImlkIjoiMTk4Iiwicm9sZV9pZCI6IjEiLCJwYWdlX2lkIjoiMTAyIiwiaXNfZW5hYmxlZCI6IjEiLCJwYWdlX25hbWUiOiJtb250aGx5X2F0dGVuZGFuY2UiLCJyb2xlcyI6WyJpbnZlbnRvcnkgbWFuYWdlIiwiZ3Vlc3QiLCJociIsImF0dGVuZGFuY2UgdXBsb2FkZXIiLCJlbXBsb3llZSIsImFkbWluIiwiaHIgcGF5cm9sbCBtYW5hZ2VyIiwiaW52ZW50b3J5IG1hbmFnZXIiXX0seyJpZCI6IjE4OSIsInJvbGVfaWQiOiIxIiwicGFnZV9pZCI6IjEwNyIsImlzX2VuYWJsZWQiOiIxIiwicGFnZV9uYW1lIjoiaG9saWRheXMiLCJyb2xlcyI6WyJpbnZlbnRvcnkgbWFuYWdlIiwiZ3Vlc3QiLCJociIsImF0dGVuZGFuY2UgdXBsb2FkZXIiLCJlbXBsb3llZSIsImFkbWluIiwiaHIgcGF5cm9sbCBtYW5hZ2VyIiwiaW52ZW50b3J5IG1hbmFnZXIiXX0seyJpZCI6IjE5MSIsInJvbGVfaWQiOiIxIiwicGFnZV9pZCI6IjEwOSIsImlzX2VuYWJsZWQiOiIxIiwicGFnZV9uYW1lIjoiYXBwbHlfbGVhdmUiLCJyb2xlcyI6WyJpbnZlbnRvcnkgbWFuYWdlIiwiZ3Vlc3QiLCJociIsImF0dGVuZGFuY2UgdXBsb2FkZXIiLCJlbXBsb3llZSIsImFkbWluIiwiaHIgcGF5cm9sbCBtYW5hZ2VyIiwiaW52ZW50b3J5IG1hbmFnZXIiXX0seyJpZCI6IjE5NSIsInJvbGVfaWQiOiIxIiwicGFnZV9pZCI6IjExMSIsImlzX2VuYWJsZWQiOiIxIiwicGFnZV9uYW1lIjoibXlfbGVhdmVzIiwicm9sZXMiOlsiaW52ZW50b3J5IG1hbmFnZSIsImhyIiwiYXR0ZW5kYW5jZSB1cGxvYWRlciIsImVtcGxveWVlIiwiYWRtaW4iLCJociBwYXlyb2xsIG1hbmFnZXIiLCJpbnZlbnRvcnkgbWFuYWdlciJdfSx7ImlkIjoiMTkwIiwicm9sZV9pZCI6IjEiLCJwYWdlX2lkIjoiMTE1IiwiaXNfZW5hYmxlZCI6IjEiLCJwYWdlX25hbWUiOiJzYWxhcnkiLCJyb2xlcyI6WyJpbnZlbnRvcnkgbWFuYWdlIiwiaHIiLCJhdHRlbmRhbmNlIHVwbG9hZGVyIiwiZW1wbG95ZWUiLCJhZG1pbiIsImhyIHBheXJvbGwgbWFuYWdlciIsImludmVudG9yeSBtYW5hZ2VyIl19LHsiaWQiOiIxOTYiLCJyb2xlX2lkIjoiMSIsInBhZ2VfaWQiOiIxMTciLCJpc19lbmFibGVkIjoiMSIsInBhZ2VfbmFtZSI6Im15X3Byb2ZpbGUiLCJyb2xlcyI6WyJpbnZlbnRvcnkgbWFuYWdlIiwiaHIiLCJhdHRlbmRhbmNlIHVwbG9hZGVyIiwiZW1wbG95ZWUiLCJhZG1pbiIsImhyIHBheXJvbGwgbWFuYWdlciIsImludmVudG9yeSBtYW5hZ2VyIl19LHsiaWQiOiIxOTQiLCJyb2xlX2lkIjoiMSIsInBhZ2VfaWQiOiIxMTgiLCJpc19lbmFibGVkIjoiMSIsInBhZ2VfbmFtZSI6Im15X2ludmVudG9yeSIsInJvbGVzIjpbImludmVudG9yeSBtYW5hZ2UiLCJociIsImF0dGVuZGFuY2UgdXBsb2FkZXIiLCJlbXBsb3llZSIsImFkbWluIiwiaHIgcGF5cm9sbCBtYW5hZ2VyIiwiaW52ZW50b3J5IG1hbmFnZXIiXX0seyJwYWdlX2lkIjoxMTgsInBhZ2VfbmFtZSI6Im15X2ludmVudG9yeSIsInJvbGVzIjpbImludmVudG9yeSBtYW5hZ2UiLCJociIsImF0dGVuZGFuY2UgdXBsb2FkZXIiLCJlbXBsb3llZSIsImFkbWluIiwiaHIgcGF5cm9sbCBtYW5hZ2VyIiwiaW52ZW50b3J5IG1hbmFnZXIiXX0seyJpZCI6IjE5MyIsInJvbGVfaWQiOiIxIiwicGFnZV9pZCI6IjEyMiIsImlzX2VuYWJsZWQiOiIxIiwicGFnZV9uYW1lIjoiZG9jdW1lbnRzIiwicm9sZXMiOlsiaW52ZW50b3J5IG1hbmFnZSIsImhyIiwiYXR0ZW5kYW5jZSB1cGxvYWRlciIsImVtcGxveWVlIiwiYWRtaW4iLCJociBwYXlyb2xsIG1hbmFnZXIiLCJpbnZlbnRvcnkgbWFuYWdlciJdfSx7ImlkIjoiMTkyIiwicm9sZV9pZCI6IjEiLCJwYWdlX2lkIjoiMTI1IiwiaXNfZW5hYmxlZCI6IjEiLCJwYWdlX25hbWUiOiJwb2xpY3lfZG9jdW1lbnRzIiwicm9sZXMiOlsiaW52ZW50b3J5IG1hbmFnZSIsImd1ZXN0IiwiaHIiLCJhdHRlbmRhbmNlIHVwbG9hZGVyIiwiZW1wbG95ZWUiLCJhZG1pbiIsImhyIHBheXJvbGwgbWFuYWdlciIsImludmVudG9yeSBtYW5hZ2VyIl19LHsicGFnZV9pZCI6MTI1LCJwYWdlX25hbWUiOiJwb2xpY3lfZG9jdW1lbnRzIiwicm9sZXMiOlsiaW52ZW50b3J5IG1hbmFnZSIsImd1ZXN0IiwiaHIiLCJhdHRlbmRhbmNlIHVwbG9hZGVyIiwiZW1wbG95ZWUiLCJhZG1pbiIsImhyIHBheXJvbGwgbWFuYWdlciIsImludmVudG9yeSBtYW5hZ2VyIl19LHsicGFnZV9pZCI6MTI5LCJwYWdlX25hbWUiOiJsb2dpbiIsInJvbGVzIjpbImhyIiwiYXR0ZW5kYW5jZSB1cGxvYWRlciIsImVtcGxveWVlIiwiYWRtaW4iLCJociBwYXlyb2xsIG1hbmFnZXIiLCJpbnZlbnRvcnkgbWFuYWdlciJdfSx7ImlkIjoiMTg3Iiwicm9sZV9pZCI6IjEiLCJwYWdlX2lkIjoiMTI5IiwiaXNfZW5hYmxlZCI6IjEiLCJwYWdlX25hbWUiOiJsb2dpbiIsInJvbGVzIjpbImhyIiwiYXR0ZW5kYW5jZSB1cGxvYWRlciIsImVtcGxveWVlIiwiYWRtaW4iLCJociBwYXlyb2xsIG1hbmFnZXIiLCJpbnZlbnRvcnkgbWFuYWdlciJdfSx7InBhZ2VfaWQiOjEzMiwicGFnZV9uYW1lIjoibG9nb3V0Iiwicm9sZXMiOlsiaW52ZW50b3J5IG1hbmFnZSIsImhyIiwiYXR0ZW5kYW5jZSB1cGxvYWRlciIsImVtcGxveWVlIiwiYWRtaW4iLCJociBwYXlyb2xsIG1hbmFnZXIiLCJpbnZlbnRvcnkgbWFuYWdlciJdfSx7ImlkIjoiMTg4Iiwicm9sZV9pZCI6IjEiLCJwYWdlX2lkIjoiMTMyIiwiaXNfZW5hYmxlZCI6IjEiLCJwYWdlX25hbWUiOiJsb2dvdXQiLCJyb2xlcyI6WyJpbnZlbnRvcnkgbWFuYWdlIiwiaHIiLCJhdHRlbmRhbmNlIHVwbG9hZGVyIiwiZW1wbG95ZWUiLCJhZG1pbiIsImhyIHBheXJvbGwgbWFuYWdlciIsImludmVudG9yeSBtYW5hZ2VyIl19LHsiaWQiOiIxOTciLCJyb2xlX2lkIjoiMSIsInBhZ2VfaWQiOiIxNDAiLCJpc19lbmFibGVkIjoiMSIsInBhZ2VfbmFtZSI6ImVkaXRfcHJvZmlsZSIsInJvbGVzIjpbImhyIiwiYXR0ZW5kYW5jZSB1cGxvYWRlciIsImVtcGxveWVlIiwiYWRtaW4iLCJociBwYXlyb2xsIG1hbmFnZXIiLCJpbnZlbnRvcnkgbWFuYWdlciJdfSx7ImlkIjoiMTk5Iiwicm9sZV9pZCI6IjEiLCJwYWdlX2lkIjoiMTQxIiwiaXNfZW5hYmxlZCI6IjEiLCJwYWdlX25hbWUiOiJDYXRlZ29yeSBEZWZhdWx0IEFjdGlvbnMgRm9yIGFsbCBSb2xlcyIsInJvbGVzIjpbImF0dGVuZGFuY2UgdXBsb2FkZXIiLCJlbXBsb3llZSIsImhyIHBheXJvbGwgbWFuYWdlciIsImludmVudG9yeSBtYW5hZ2VyIiwiYWRtaW4iLCJhZG1pbiIsImhyIl19LHsiaWQiOiIyNzIiLCJyb2xlX2lkIjoiMSIsInBhZ2VfaWQiOiIxNTEiLCJpc19lbmFibGVkIjoiMSIsInBhZ2VfbmFtZSI6InVzZXJfdGltZVNoZWV0Iiwicm9sZXMiOlsiZW1wbG95ZWUiLCJlbXBsb3llZSIsImFkbWluIiwiYWRtaW4iLCJociJdfSx7ImlkIjoiMjczIiwicm9sZV9pZCI6IjEiLCJwYWdlX2lkIjoiMTUxIiwiaXNfZW5hYmxlZCI6IjEiLCJwYWdlX25hbWUiOiJ1c2VyX3RpbWVTaGVldCIsInJvbGVzIjpbImVtcGxveWVlIiwiZW1wbG95ZWUiLCJhZG1pbiIsImFkbWluIiwiaHIiXX1dLCJyb2xlX2FjdGlvbnMiOlsiZ2V0X2hvbGlkYXlzX2xpc3QiLCJnZXRfdXNlcl9zYWxhcnlfaW5mbyIsImFwcGx5X2xlYXZlIiwiZ2V0X3VzZXJfcG9saWN5X2RvY3VtZW50IiwiZ2V0X3VzZXJfZG9jdW1lbnQiLCJnZXRfdW5hc3NpZ25lZF9pbnZlbnRvcmllcyIsImdldF9teV9pbnZlbnRvcmllcyIsImFkZF9pbnZlbnRvcnlfYXVkaXQiLCJ1bmFzc2lnbmVkX215X2ludmVudG9yeSIsImludmVudG9yeV91bmFzc2lnbl9yZXF1ZXN0IiwiZ2V0X215X2xlYXZlcyIsImdldF9teV9yaF9sZWF2ZXMiLCJnZXRfdXNlcl9yaF9zdGF0cyIsImNhbmNlbF9hcHBsaWVkX2xlYXZlIiwiZ2V0X3VzZXJfcHJvZmlsZV9kZXRhaWwiLCJ1cGRhdGVfdXNlcl9wcm9maWxlX2RldGFpbCIsInVwZGF0ZV9uZXdfcGFzc3dvcmQiLCJ1cGRhdGVfdXNlcl9iYW5rX2RldGFpbCIsIm1vbnRoX2F0dGVuZGFuY2UiLCJ1c2VyX2RheV9zdW1tYXJ5IiwiYWRkX21hbnVhbF9hdHRlbmRhbmNlIiwiZ2V0X21hY2hpbmVfc3RhdHVzX2xpc3QiLCJnZXRfbWFjaGluZXNfZGV0YWlsIiwiZ2V0X21hY2hpbmVfdHlwZV9saXN0IiwiYXNzaWduX3VzZXJfbWFjaGluZSIsImdldF9tYWNoaW5lIiwidXBkYXRlX3VzZXJfcG9saWN5X2RvY3VtZW50IiwidXNlcl9yaF9saXN0X2Zvcl9jb21wZW5zYXRpb24iLCJnZXRfdXNlcl90aW1lc2hlZXQiLCJnZXRfdXNlcl90aW1lc2hlZXQiLCJ1c2VyX3RpbWVzaGVldF9lbnRyeSIsInVzZXJfdGltZXNoZWV0X2VudHJ5Iiwic3VibWl0X3RpbWVzaGVldCIsInN1Ym1pdF90aW1lc2hlZXQiLCJnZXRfdXNlcl90bXNfcmVwb3J0IiwiZ2V0X3VzZXJfdG1zX3JlcG9ydCJdLCJpc19wb2xpY3lfZG9jdW1lbnRzX3JlYWRfYnlfdXNlciI6MSwiaXNfaW52ZW50b3J5X2F1ZGl0X3BlbmRpbmciOjB9.F-KxJksVgx-bSrBQnCXr3jyhPmTD4-WnKJAAH4BNcNU');
        StorageUtil.setUserId("540");
       StorageUtil.setLoggedIn(true);
    return Future.value(
        User(user: 540, token: '112211', message: 'Success Login'));
  }
}

// final User mockUser =
//     User(user: 540, token: '112211', message: 'Success Login');
void main() {
  setupDependencyAssembler();
  var userLogin = dependencyAssembler<LoginAuthenticationService>();
  userLogin.api = MockLogin();
  FlutterDriver driver;
  group('check login', () {
    test('Form Fill/', () async {
       await driver.tap(find.byValueKey('Username'));
  await driver.enterText('kartikjabreba');
  await driver.tap(find.byValueKey('Password'));
  await driver.enterText('CMJ97');
      await driver.tap(find.text('Login'));
      //await driver.waitFor(find.byType(""))
       await driver.waitFor(find.text('Inventory'));
    });
  });
}

// import 'package:flutter_driver/flutter_driver.dart';
// import 'package:flutter_excellence_hr/model/user.dart';
// import 'package:flutter_excellence_hr/services/login.dart';
// import 'package:mockito/mockito.dart';
// import 'package:test/test.dart';

// void main() {
//   group('Hr App/', () {
//     FlutterDriver driver;

//     Future<void> tap(SerializableFinder element) async {
//       await driver.tap(element);
//     }

//     Future<void> type(SerializableFinder element, String text) async {
//       await tap(element);
//       await driver.enterText(text);
//     }

//     SerializableFinder findByKey(String key) {
//       return find.byValueKey(key);
//     }

//     setUpAll(() async {
//       driver = await FlutterDriver.connect();
//     });
//     tearDownAll(() async {
//       if (driver != null) {
//         driver.close();
//       }
//     });

//     test('should login successfully', () async {
//       SerializableFinder button = findByKey("button");

//       await tap(button);
//       driver.requestData("login");
//     });

// test('Form Fill/', () async {
  // await driver.tap(find.byValueKey('Username'));
  // await driver.enterText('kartikjabreba');
  // await driver.tap(find.byValueKey('Password'));
  // await driver.enterText('CMJ97');
//   await driver.tap(find.text('Login'));
//   await driver.waitFor(find.text('Inventory'));
// });
//   });
// }

// class MockLogin extends Login {
//   @override
//   Future<User> login(String username, String password) {
//     return Future.value(
//      User(user: 540,token: '100100',message: 'Success')
//     );
//   }
// }
