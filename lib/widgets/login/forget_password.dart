import 'dart:async';
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_excellence_hr/bloc/login/login.dart';
import 'package:flutter_excellence_hr/model/profile/ProfileDetails.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_excellence_hr/screens/login_screen.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../../services/login/forget_password_api.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _passwordController = TextEditingController();
  bool userNameValidate = false;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final RoundedLoadingButtonController _btnController =
      new RoundedLoadingButtonController();

  UpdateForgetPassword api = UpdateForgetPassword();
  ProfileDetails profileDetails;
  void _doUpdate() async {
    if (_passwordController.text.isEmpty) {
      return _btnController.reset();
    }
    await api.updateForgetPassword(_passwordController.text).then((value) {
      if (value.error == 1) {
        _error();
      } else if (value.error == 0) {
        _btnController.success();
      }
      _doReset();
    });
  }

  void _doReset() async {
    Timer(Duration(seconds: 2), () {
      _btnController.reset();
    });
  }

  _error() {
    _btnController.error();
  }

  @override
  Widget build(BuildContext context) {
    final _loginBloc = BlocProvider.of<LoginBloc>(context);
    bool validateTextField(String userInput) {
      if (userInput.isEmpty) {
        setState(() {
          userNameValidate = true;
        });
        return false;
      }
      setState(() {
        userNameValidate = false;
      });
      return true;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Container(
                  height: 80,
                  margin: EdgeInsets.only(left: 32, right: 32),
                  child: Image(
                    image: AssetImage('assets/images/logo.png'),
                  ),
                ),
              ),
            ],
          ),
          Container(
            color: Colors.white,
            margin: EdgeInsets.only(left: 16, right: 16),
            child: Column(children: <Widget>[
              Row(
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 16, top: 32, bottom: 16),
                      child: Text(
                        "Reset Your Password",
                        style: TextStyle(
                            color: AppColors.LIGHTBLACK_COLOR,
                            fontFamily: 'SourceSans'),
                      )),
                ],
              ),
              Container(
                color: AppColors.EDIT_TEXT_COLOR,
                margin: EdgeInsets.fromLTRB(16, 0, 16, 12),
                child: TextFormField(
                  key: Key('ResetPassword'),
                  controller: _passwordController,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(),
                    labelText: 'Usename',
                    errorText: userNameValidate
                        ? "Please enter valid user name"
                        : null,
                  ),
                ),
              ),
              Container(
                height: 40,
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(16, 0, 16, 12),
                child: RoundedLoadingButton(
                  color: AppColors.BTN_BLACK_COLOR,
                  borderRadius: 10,
                  child: Text('Reset Password',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  controller: _btnController,
                  onPressed: () {
                    validateTextField(_passwordController.text);
                    _doUpdate();
                    _loginBloc.add(UserLogOut());
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      },
                      child: Container(
                          margin: EdgeInsets.only(left: 16, bottom: 32),
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: AppColors.BLUE_COLOR,
                                fontSize: 16,
                                fontFamily: 'SourceSans'),
                          )),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ],
      )),
    );
  }
}
