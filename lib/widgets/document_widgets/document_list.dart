import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';

class DocumentList extends StatelessWidget {
  List<String> listOf = [
    "CV",
    "PAN Card",
    "Address Proof",
    "Photo",
    "Offer Letter",
    "Appointment Letter",
    "Previous Company Experience Letter",
    "Previous Company offer Letter",
    "Previous Company Salary Slip",
    "Previous Company Other  Documents",
    "Qualification Certificate",
    "Other Documents"
  ];

  List<String> listNum = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12"
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsets.all(3),
        padding: EdgeInsets.all(3),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (_, int index) =>
              listDocument(this.listOf[index], this.listNum[index]),
          itemCount: this.listOf.length,
        ),
      ),
    );
  }
}

class listDocument extends StatelessWidget {
  String itemDoc, srNum;
  listDocument(this.itemDoc, this.srNum);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3),
      padding: EdgeInsets.all(3),
      child: Row(children: <Widget>[
        CircleAvatar(
          child: Text(
            srNum,
            style: TextStyle(
                color: Colors.black54, fontSize: 12, fontFamily: 'OpenSans'),
          ),
          backgroundColor: Colors.grey[200],
          foregroundColor: Colors.white,
          radius: 10,
        ),
        Padding(padding: EdgeInsets.all(4)),
        Flexible(
          child: Text(
            itemDoc,
            style: TextStyle(fontSize: 12, fontFamily: 'SourceSans'),
          ),
        )
      ]),
    );
  }
}
