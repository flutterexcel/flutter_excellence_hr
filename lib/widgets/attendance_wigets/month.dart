import 'package:flutter/material.dart';

class Month extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.blue,
        child: ListTile(
          leading: Icon(
            Icons.keyboard_arrow_left,
            color: Colors.white,
          ),
          title: Text(
            'SEPTEMPER-2020',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontFamily: 'SourceSans'),
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.white,
          ),
        ));
  }
}
