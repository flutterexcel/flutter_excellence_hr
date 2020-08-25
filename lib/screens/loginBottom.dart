import 'package:flutter/material.dart';

class LoginBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(32, 16, 16, 8),
                child: Text('About Excellence HRMS',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color(0xff485057))),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(32, 0, 32, 16),
                child: Text(
                    'Say goodbye to cluttered spreadsheets From attendence to timesheets and performance, run HR on the cloud. Get more done with a simple user interface, effortless automation, and efficient processing.',
                    style: TextStyle(fontSize: 15, color: Color(0xff485057))),
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
                        color: Color(0xff485057))),
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Container(
                    margin: EdgeInsets.fromLTRB(32, 0, 0, 16),
                    child: Image.asset(
                      'assets/images/greenbtn.png',
                      width: 10,
                      height: 10,
                    ))),
            Expanded(
              flex: 9,
              child: Container(
                margin: EdgeInsets.fromLTRB(8, 0, 32, 16),
                child: Text('Core HR: Attendence,Leaves & Timesheets',
                    style: TextStyle(fontSize: 15, color: Color(0xff485057))),
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Container(
                    margin: EdgeInsets.fromLTRB(32, 0, 0, 16),
                    child: Image.asset(
                      'assets/images/greenbtn.png',
                      width: 10,
                      height: 10,
                    ))),
            Expanded(
              flex: 9,
              child: Container(
                margin: EdgeInsets.fromLTRB(8, 0, 32, 16),
                child: Text('Manage Employee & Maintain Employee Life Cycle',
                    style: TextStyle(fontSize: 15, color: Color(0xff485057))),
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Container(
                    margin: EdgeInsets.fromLTRB(32, 0, 0, 16),
                    child: Image.asset(
                      'assets/images/greenbtn.png',
                      width: 10,
                      height: 10,
                    ))),
            Expanded(
              flex: 9,
              child: Container(
                margin: EdgeInsets.fromLTRB(8, 0, 32, 16),
                child: Text('Salary Management',
                    style: TextStyle(fontSize: 15, color: Color(0xff485057))),
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Container(
                    margin: EdgeInsets.fromLTRB(32, 0, 0, 16),
                    child: Image.asset(
                      'assets/images/greenbtn.png',
                      width: 10,
                      height: 10,
                    ))),
            Expanded(
              flex: 9,
              child: Container(
                margin: EdgeInsets.fromLTRB(8, 0, 32, 16),
                child: Text('Mail Templates & Variables',
                    style: TextStyle(fontSize: 15, color: Color(0xff485057))),
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Container(
                    margin: EdgeInsets.fromLTRB(32, 0, 0, 16),
                    child: Image.asset(
                      'assets/images/greenbtn.png',
                      width: 10,
                      height: 10,
                    ))),
            Expanded(
              flex: 9,
              child: Container(
                margin: EdgeInsets.fromLTRB(8, 0, 32, 16),
                child: Text('Employee Document Management',
                    style: TextStyle(fontSize: 15, color: Color(0xff485057))),
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Container(
                    margin: EdgeInsets.fromLTRB(32, 0, 0, 16),
                    child: Image.asset(
                      'assets/images/greenbtn.png',
                      width: 10,
                      height: 10,
                    ))),
            Expanded(
              flex: 9,
              child: Container(
                margin: EdgeInsets.fromLTRB(8, 0, 32, 16),
                child: Text('Auditing and Inventory Management',
                    style: TextStyle(fontSize: 15, color: Color(0xff485057))),
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Container(
                    margin: EdgeInsets.fromLTRB(32, 0, 0, 16),
                    child: Image.asset(
                      'assets/images/greenbtn.png',
                      width: 10,
                      height: 10,
                    ))),
            Expanded(
              flex: 9,
              child: Container(
                margin: EdgeInsets.fromLTRB(8, 0, 32, 16),
                child: Text('Team Management',
                    style: TextStyle(fontSize: 15, color: Color(0xff485057))),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
