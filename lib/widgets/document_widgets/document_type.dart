import 'package:flutter/material.dart';

class DocumentType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  "Document Type",
                  style: TextStyle(fontSize: 20, fontFamily: 'OpenSans'),
                )),
          ],
        ),
      ],
    );
  }
}
