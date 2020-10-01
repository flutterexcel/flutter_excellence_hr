import 'package:flutter/material.dart';

class UploadDocuments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
        Row(
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(8, 32, 0, 16),
                child: Text(
                  "Upload",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'OpenSans',
                  ),
                )),
            Container(
                margin: EdgeInsets.fromLTRB(8, 32, 32, 16),
                child: Text(
                  "New Documents",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'SourceSans',
                      fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ]),
    );
  }
}