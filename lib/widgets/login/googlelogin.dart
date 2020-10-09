import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/screens/show_inventory.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleLogin extends StatefulWidget {
  @override
  _GoogleLoginState createState() => _GoogleLoginState();
}

class _GoogleLoginState extends State<GoogleLogin> {
  @override
  Widget build(BuildContext context) {
    bool _isLoggedIn = false;

    GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

    _login() async {
      try {
        await _googleSignIn.signIn();
        setState(() {
          _isLoggedIn = true;
        });
      } catch (err) {
        print(err);
      }
    }

    return _isLoggedIn
        ? ShowInventory()
        : Column(
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.fromLTRB(32.0, 5.0, 32.0, 5.0),
                      child: RaisedButton(
                          padding:
                              EdgeInsets.only(top: 3.0, bottom: 3.0, left: 3.0),
                          color: Color(0xFF4285F4),
                          onPressed: () {
                            _login();
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0))),
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
                                    margin: EdgeInsets.only(
                                        left: 10.0, right: 10.0),
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
