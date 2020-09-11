import 'package:flutter/material.dart';

class RequiredDocument extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(8, 32, 0, 16),
                child: Text(
                  "Required",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'OpenSans',
                  ),
                )),
            Container(
                margin: EdgeInsets.fromLTRB(8, 32, 32, 16),
                child: Text(
                  "Documents",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'SourceSans',
                      fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ],
    );
  }
}
