import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Content extends StatelessWidget {
  DateTime firstDayOfTheweek;
  DateFormat formatter = DateFormat('yyyy-MM-dd');
  Content({this.firstDayOfTheweek});
  @override
  Widget build(BuildContext context) {
    String formatted = formatter.format(firstDayOfTheweek);
    return Container(child: Text("The first week date is:>> " + formatted));
  }
}
