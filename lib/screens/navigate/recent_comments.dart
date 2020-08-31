import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';

class RecentComments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
            child: Text('Recent Comments',
                style: TextStyle(
                    fontSize: 22, color: AppColors.LIGHTBLACK_COLOR))),
      ],
    );
  }
}
