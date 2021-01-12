import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Content extends StatefulWidget {
  DateTime firstDayOfTheweek;
  Content({this.firstDayOfTheweek});

  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  DateFormat formatter = DateFormat('yyyy-MM-dd');
  DateTime firstDayOfTheweek;
  @override
  Widget build(BuildContext context) {
    String formatted = formatter.format(widget.firstDayOfTheweek);
    return Container(child: Text("The first week date is:>> " + formatted));
  }
}
