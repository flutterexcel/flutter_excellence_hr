import 'package:flutter/material.dart';
import 'services/login.dart';
import 'model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(HrApp());
}

class HrApp extends StatelessWidget {
  // This widget is the root of your application.
  final Login api = Login();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Excellence HR',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Center(
            child: Column(children: <Widget>[
          Container(
            margin: EdgeInsets.all(20),
            child: FlatButton(
              child: Text('Login'),
              color: Colors.blueAccent,
              textColor: Colors.white,
              onPressed: () {
                print('login');
                api.login('deepak', '').then((User user) async {
                  print(user.token + "x" + user.message + "x" + user.userid);
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  print(prefs.getString('userid'));
                });
              },
            ),
          ),
        ])));
  }
}
