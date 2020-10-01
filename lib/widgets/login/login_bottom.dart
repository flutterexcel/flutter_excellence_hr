import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'bottom_list.dart';
import 'bottom_feature.dart';

class LoginBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        BottomList(text: 'About Excellence HRMS'),
        Row(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(32, 0, 32, 16),
                child: Text(
                    'Say goodbye to cluttered spreadsheets From attendence to timesheets and performance, run HR on the cloud. Get more done with a simple user interface, effortless automation, and efficient processing.',
                    style: TextStyle(
                        fontSize: 15, color: AppColors.LIGHTBLACK_COLOR)),
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(32, 16, 16, 8),
                child: Text('Features',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: AppColors.LIGHTBLACK_COLOR)),
              ),
            ),
          ],
        ),
        BottomFeature(
          text: 'Core HR: Attendence,Leaves & Timesheets',
        ),
        BottomFeature(text: 'Manage Employee & Maintain Employee Life Cycle'),
        BottomFeature(text: 'Salary Management'),
        BottomFeature(text: 'Mail Templates & Variables'),
        BottomFeature(text: 'Employee Document Management'),
        BottomFeature(text: 'Auditing and Inventory Management'),
        BottomFeature(text: 'Team Management'),
      ],
    );
  }
}
