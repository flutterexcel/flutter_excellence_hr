import 'package:flutter/material.dart';

class NavListItem extends StatefulWidget {
  @override
  _NavListItemState createState() => _NavListItemState();
}

class _NavListItemState extends State<NavListItem> {
  String text;
  _NavListItemState({this.text});
  @override
  Widget build(BuildContext context) {
    return Column(
      children:<Widget> [
          ListTile(
              leading: Icon(Icons.person),
              title: Text(text),
            ),
      ],
    );
  }
}