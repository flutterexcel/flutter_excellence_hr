import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_excellence_hr/screens/navigate/navigation.dart';

class InventoryProfilePic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(16, 16, 16, 32),
          child: CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/images/person.jpg'),
          ),
        ),
      ],
    );
  }
}