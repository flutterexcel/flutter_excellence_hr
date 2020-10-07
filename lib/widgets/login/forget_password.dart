import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_excellence_hr/screens/login_screen.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../../services/login/forget_password_api.dart';

class ForgetPassword extends StatelessWidget {
  final _passwordController = TextEditingController();
  final RoundedLoadingButtonController _btnController =
      new RoundedLoadingButtonController();
  UpdateForgetPassword api = UpdateForgetPassword();
  void _doUpdate() async {
    await api
        .updateForgetPassword(_passwordController.text)
        .then((value) => _btnController.success());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BACKGROUND_COLOR,
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
                    image: AssetImage('assets/images/logo.jpg'),
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
                height: 40,
                color: AppColors.EDIT_TEXT_COLOR,
                //To make
                margin: EdgeInsets.fromLTRB(16, 0, 16, 12),
                child: TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Usename',
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
                      style: TextStyle(color: Colors.white)),
                  controller: _btnController,
                  onPressed: _doUpdate,
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
