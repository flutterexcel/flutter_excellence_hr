import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_excellence_hr/bloc/login/login_bloc.dart';
import 'package:flutter_excellence_hr/bloc/login/login_event.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'dart:io';
//import 'package:universal_io/io.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../../services/profile/update_pass.dart';

class EnterPassword extends StatefulWidget {
  @override
  _EnterPasswordState createState() => _EnterPasswordState();
}

class _EnterPasswordState extends State<EnterPassword> {
  final password = TextEditingController();
  final RoundedLoadingButtonController _btnController =
      new RoundedLoadingButtonController();
  UpdatePassword api = UpdatePassword();

  void _doReset() async {
    Timer(Duration(seconds: 2), () {
      _btnController.reset();
    });
  }

  void _doUpdate() async {
    await api.updatePassword(password.text).then((value) {
      if (value.error == 0) _btnController.success();
      _btnController.reset();
    });
  }

  bool userNameValidate = false;
  @override
  Widget build(BuildContext context) {
    // Widget _getFAB() {
    //   if (Platform.isWindows) {
    //    return ;
    //  } else {
    //     ;
    //   }
    // }
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
          child: TextFormField(
            key: Key('updatePassword'),
            controller: password,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              errorText: userNameValidate ? "Password can't be blank" : null,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              key: Key('update'),
              margin: EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: RoundedLoadingButton(
                color: AppColors.BTN_BLACK_COLOR,
                width: 150,
                borderRadius: 10,
                child: Text('Update Password',
                    style: TextStyle(color: Colors.white)),
                controller: _btnController,
                onPressed: () {
                  if (password.text.isEmpty) {
                    (!validateTextField(password.text));
                    _btnController.reset();
                    return;
                  } else {
                    validateTextField(password.text);
                    _doUpdate();
                    Navigator.pushNamedAndRemoveUntil(
                        context, "/", (route) => false);
                    _loginBloc.add(UserLogOut());
                  }
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
