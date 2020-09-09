import 'package:flutter/material.dart';


class AppBarWidget extends StatelessWidget {
  String pageName;
  AppBarWidget({this.pageName});
  @override
  Widget build(BuildContext context) {
    return  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(pageName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/images/person.jpg'))
          ],
    
    );
  }
}