import 'package:flutter/material.dart';
import 'services/login.dart';
import 'model/user.dart';
import 'services/storage_service.dart';

void main() async {
  StorageUtil.getInstance();
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
              child: Text('Login' + StorageUtil.getString('userid')),
              color: Colors.blueAccent,
              textColor: Colors.white,
              onPressed: () async {
                print('tt' + StorageUtil.getString('userid'));
                print('login');
                api.login('deepak', 'XT13T').then((User user) async {
                  // print(user.token + "x" + user.message + "x" + user.userid);

                  print('tt' + StorageUtil.getString('token'));
                });
              },
            ),
          ),
        ])));
  }
}
