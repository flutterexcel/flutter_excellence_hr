import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_excellence_hr/bloc/bloc.dart';
import 'package:flutter_excellence_hr/screens/show_inventory.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleLogin extends StatelessWidget {
  void alertDialog(BuildContext context) {
    var alert = AlertDialog(
      title: Text('For HRMS '),
      content: Text('Use Company email id'),
      actions: <Widget>[
        FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'YES',
              style: TextStyle(fontSize: 20),
            ))
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext c) {
          return alert;
        });
  }

  @override
  Widget build(BuildContext context) {
    final _loginBloc = BlocProvider.of<LoginBloc>(context);
    GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

    _login() async {
      try {
        await _googleSignIn.signIn().then((result) {
          result.authentication.then((googleKey) {
            if (_googleSignIn.currentUser.email
                .contains("@excellencetechnologies")) {
              _loginBloc.add(LoginInWithGoogleButtonPressed(
                  googleToken: googleKey.accessToken));
            } else {
              alertDialog(context);
              _googleSignIn.signOut();
            }
          }).catchError((err) {});
        }).catchError((err) {});
      } catch (err) {}
    }

    return Column(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(32.0, 5.0, 32.0, 5.0),
                child: RaisedButton(
                    padding: EdgeInsets.only(top: 3.0, bottom: 3.0, left: 3.0),
                    color: Color(0xFF4285F4),
                    onPressed: () {
                      _login();
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    child: new Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          child: new Image.asset(
                            'assets/images/googlelogo.png',
                            height: 30.0,
                            width: 30,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Expanded(
                          child: Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(left: 10.0, right: 10.0),
                              child: new Text(
                                "Login with your company google account",
                                style: TextStyle(
                                  fontFamily: 'SourceSans',
                                  color: Colors.white,
                                ),
                              )),
                        ),
                      ],
                    )),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
