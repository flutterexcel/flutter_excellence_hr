import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_excellence_hr/services/storage_service.dart';
import 'package:flutter_excellence_hr/widgets/login/login.dart';
import '../../bloc/bloc.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

class LoginPage extends StatelessWidget {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _passwordController = TextEditingController(text: StorageUtil.getPassword());
  final _emailController = TextEditingController(text: StorageUtil.getUserName());
  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    final _loginBloc = BlocProvider.of<LoginBloc>(context);

    _onLoginButtonPressed() {
      _loginBloc.add(LoginInWithEmailButtonPressed(
          email: _emailController.text, password: _passwordController.text));
    }

    LoginState state = _loginBloc.state;
   
    return Form(
      key: _key,
      // autovalidate: _autoValidate,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              color: AppColors.EDIT_TEXT_COLOR,
              //To make
              margin: EdgeInsets.fromLTRB(32, 10, 32, 12),
              child: TextFormField(
                key: Key('Username'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter username';
                  }
                  return null;
                },
                controller: _emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              color: AppColors.EDIT_TEXT_COLOR,
              margin: EdgeInsets.fromLTRB(32, 0, 32, 8),
              child: TextFormField(
                key: Key('Password'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter password';
                  }
                  return null;
                },
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
                onPressed: () {
                  // Validate returns true if the form is valid, otherwise false.
                  if (_key.currentState.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    _onLoginButtonPressed();
                    Scaffold.of(context)
                        .showSnackBar(SnackBar(content: Text('Login ....')));
                  }
                  if (StorageUtil.getLoggedIn()==false) {
                    Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text('Invalid username and password.')));
                  }
                  if (StorageUtil.getLoggedIn()) {
                    Scaffold.of(context)
                        .showSnackBar(SnackBar(content: Text('Login Success')));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
