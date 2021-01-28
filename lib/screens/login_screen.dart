import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_excellence_hr/globals.dart';
import 'package:flutter_excellence_hr/screens/show_inventory.dart';
import 'package:flutter_excellence_hr/services/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../bloc/bloc.dart';
import '../services/authentication_services.dart';
import '../widgets/login/login.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
          minimum: const EdgeInsets.all(16),
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              if (state is LoginFailure) {
                return _AuthForm(); // show authentication form
              }
              // show splash screen
              return Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              );
            },
          )),
    ));
  }
}

class _AuthForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
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
        ));
  }
}
