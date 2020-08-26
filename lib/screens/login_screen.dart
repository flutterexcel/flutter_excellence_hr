import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import '../screens/login_bottom.dart';
import '../screens/login_page.dart';
import '../screens/welcome_screen.dart';
import '../widgets/google_login.dart';
import '../widgets/logo.dart';

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
