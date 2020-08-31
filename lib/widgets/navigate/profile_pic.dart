import 'package:flutter/material.dart';

class InventoryProfilePic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(16, 32, 16, 32),
          child: CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('assets/images/person.jpg'),
          ),
        ),
      ],
    );
  }
}
