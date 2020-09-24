import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.fromLTRB(16, 48, 32, 32),
        child: Image.asset(
          'assets/images/logo.png',
          height: 50,
        ),
      ),
    );
  }
}