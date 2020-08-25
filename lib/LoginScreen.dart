import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/screens/loginBottom.dart';
import 'package:flutter_excellence_hr/screens/loginPage.dart';
import 'package:flutter_excellence_hr/screens/welcomeScreen.dart';
import 'package:flutter_excellence_hr/widgets/googleLogin.dart';
import 'widgets/logo.dart';
import 'widgets/googleLogin.dart';
import 'screens/loginBottom.dart';
import 'screens/welcomeScreen.dart';
import 'screens/loginPage.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f9fa), // just add oxff before hexa code
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            //      mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Logo(),
                ],
              ),
              WelcomeScreen(),
              LoginPage(),
              GoogleLogin(),
              LoginBottom(),
            ],
          ),
        ),
      ),
    );
  }
}
