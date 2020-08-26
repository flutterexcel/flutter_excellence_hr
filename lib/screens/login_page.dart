import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 40,
          color: AppColors.EDIT_TEXT_COLOR,
          //To make
          margin: EdgeInsets.fromLTRB(32, 10, 32, 12),
          child: TextField(
            controller: nameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Usename',
            ),
          ),
        ),
        Container(
          height: 40,
          color: AppColors.EDIT_TEXT_COLOR,
          margin: EdgeInsets.fromLTRB(32, 0, 32, 8),
          child: TextField(
            obscureText: true,
            controller: passwordController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 0, 32, 0),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Forget password',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.BLUE_COLOR,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          height: 40,
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(32, 8, 32, 16),
          child: RaisedButton(
            textColor: Colors.white,
            color: AppColors.BTN_BLACK_COLOR,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            child: Text('Login'),
            onPressed: () {
              print(nameController.text);
              print(passwordController.text);
            },
          ),
        ),
      ],
    );
  }
}
