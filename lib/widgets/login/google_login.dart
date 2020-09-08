import 'package:flutter/material.dart';
import "package:google_sign_in/google_sign_in.dart";

GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['profile', 'email']);

class GoogleLogin extends StatefulWidget {
  @override
  _GoogleLoginState createState() => _GoogleLoginState();
}

class _GoogleLoginState extends State<GoogleLogin> {
  GoogleSignInAccount _currentUser;

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
  }

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(32.0, 5.0, 32.0, 5.0),
                child: new RaisedButton(
                    padding: EdgeInsets.only(top: 3.0, bottom: 3.0, left: 3.0),
                    color: Color(0xFF4285F4),
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    child: new Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          child: new Image.asset(
                            'assets/images/googlelogo.png',
                            height: 30.0,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(left: 10.0, right: 10.0),
                          child: RaisedButton(
                            onPressed: _handleSignIn,
                            child:
                                Text('Login with your company google account'),
                          ),
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

Future<void> _handleSignIn() async {
  try {
    await _googleSignIn.signIn();
  } catch (error) {
    print(error);
  }
}
