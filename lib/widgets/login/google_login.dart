import 'package:flutter/material.dart';

class GoogleLogin extends StatefulWidget {
  @override
  _GoogleLoginState createState() => _GoogleLoginState();
}

class _GoogleLoginState extends State<GoogleLogin> {
  @override
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
                    color:  Color(0xFF4285F4),
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
                            child: new Text(
                              "Login with your company google account",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
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
