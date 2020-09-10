import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'dart:io';
import 'package:universal_io/io.dart';

class EnterPassword extends StatelessWidget {
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Widget _getFAB() {
      if (Platform.isWindows) {
        return RaisedButton(
          onPressed: () {},
          color: AppColors.BTN_BLUE,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          textColor: Colors.white,
          child: Text(
            "Update password",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 18,
            ),
          ),
        );
      } else {
        RaisedButton(
          onPressed: () {},
          color: AppColors.BTN_BLUE,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          textColor: Colors.white,
          child: Text(
            "Update password",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 18,
            ),
          ),
        );
      }
    }

    return Column(
      children: <Widget>[
        Row(
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  "Enter New Password",
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 18,
                      color: AppColors.MIDIUM_BLACK),
                )),
          ],
        ),
        Container(
          margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
          height: 35,
          child: TextFormField(
            controller: password,
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 35,
              margin: EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: _getFAB(),
            ),
          ],
        ),
      ],
    );
  }
}
