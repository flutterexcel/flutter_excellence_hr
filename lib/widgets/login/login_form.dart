import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_excellence_hr/widgets/login/login.dart';
import '../../bloc/bloc.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

class LoginPage extends StatelessWidget {
//  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    final _loginBloc = BlocProvider.of<LoginBloc>(context);

    _onLoginButtonPressed() {
      _loginBloc.add(LoginInWithEmailButtonPressed(
          email: _emailController.text, password: _passwordController.text));
    }

    LoginState state = _loginBloc.state;

    if (state is LoginLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Form(
      //   key: _key,
      //  autovalidate: _autoValidate,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 40,
              color: AppColors.EDIT_TEXT_COLOR,
              //To make
              margin: EdgeInsets.fromLTRB(32, 10, 32, 12),
              child: TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Usename',
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 40,
              color: AppColors.EDIT_TEXT_COLOR,
              margin: EdgeInsets.fromLTRB(32, 0, 32, 8),
              child: TextFormField(
                obscureText: true,
                controller: _passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 32, 0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgetPassword()),
                        );
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
            const SizedBox(
              height: 16,
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
                child: Text(
                  'Login',
                  style: TextStyle(fontFamily: 'SourceSans'),
                ),
                onPressed:
                    state is LoginLoading ? () {} : _onLoginButtonPressed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
