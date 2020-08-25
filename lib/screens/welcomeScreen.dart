import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(32, 0, 0, 0),
                child: Text('Welcome to',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xff485057),
                    ))),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(32, 0, 8, 32),
                child: Text('Human Resource Management System',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Color(0xff485057))),
              ),
            ),
          ],
        ),
      ],
    );
  }
}