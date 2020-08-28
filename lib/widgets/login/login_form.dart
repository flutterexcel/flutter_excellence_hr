import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/bloc.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

class LoginPage extends StatelessWidget {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    final _loginBloc = BlocProvider.of<LoginBloc>(context);

    _onLoginButtonPressed() {
      // if (_key.currentState.validate()) {
      _loginBloc.add(LoginInWithEmailButtonPressed(
          email: _emailController.text, password: _passwordController.text));
      // } else {
      //   setState(() {
      //     _autoValidate = true;
      //   });
      // }
    }

    LoginState state = _loginBloc.state;

    print("login form dart line 40");
    print(state.toString());

    if (state is LoginFailure) {
      _showError(state.error, context);
    }

    if (state is LoginLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Form(
      key: _key,
      autovalidate: _autoValidate,
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
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 32, 0),
                    child: InkWell(
                      onTap: () {
                        print('forgot');
                        print(state);
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
                child: Text('Login'),
                onPressed:
                    state is LoginLoading ? () {} : _onLoginButtonPressed,
              ),
            ),
          ],
        ),
      ),
    );

    // return BlocListener<LoginBloc, LoginState>(
    //   listener: (context, state) {
    //     if (state is LoginFailure) {
    //       _showError(state.error);
    //     }
    //   },
    //   child: BlocBuilder<LoginBloc, LoginState>(
    //     builder: (context, state) {

    //     },
    //   ),
    // );
  }

  void _showError(String error, context) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('Invalid login details!'),
      backgroundColor: Theme.of(context).errorColor,
    ));
  }
}
