import 'package:flutter/material.dart';

class AppBarWidget extends StatefulWidget {
  final String pageName;
  const AppBarWidget({Key key, this.pageName}) : super(key: key);

  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.pageName,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold)),
        CircleAvatar(
            radius: 20, backgroundImage: AssetImage('assets/images/person.jpg'))
      ],
    );
  }
}
