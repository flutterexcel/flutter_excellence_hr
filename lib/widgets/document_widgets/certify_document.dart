import 'package:flutter/material.dart';

class CertifyDocuments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Checkbox(value: false, onChanged: (bool value) {}),
            Flexible(
              child: Container( margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: Text(
                  'By uploading this document you certify that these documents are true and all information is correct',
                  style: TextStyle(color: Colors.redAccent,fontSize: 12,)
                ),
              ),
            ),
          ],
        ),        
      ],
    );
  }
}
