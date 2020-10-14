import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_excellence_hr/services/document/mydocument.dart';
import '../../model/document/document_list.dart';

class DocumentLists extends StatelessWidget {
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
              ListDocument(this.listOf[index], this.listNum[index]),
          itemCount: this.listOf.length,
        ),
      ),
    );
  }
}

class ListDocument extends StatefulWidget {
  String itemDoc, srNum;
  ListDocument(this.itemDoc, this.srNum);
  @override
  _ListDocumentState createState() =>
      _ListDocumentState(itemDoc: itemDoc, srNum: srNum);
}

class _ListDocumentState extends State<ListDocument> {
  MyDocument api = MyDocument();
  DocumentList documentList;
  bool show = false;
  List<ListDoc> docUploaded = [];
  bool checkValue = false;
  _getDocumentList() async {
    return await api.getDocument().then((value) {
      documentList = value;
      if (documentList.data.userDocumentInfo.contains("CV")) checkValue = true;
    });
  }

  // @override
  // void initState() {
  //   super.initState();
  //   _getDocumentList();
  // }

  String itemDoc, srNum;

  _ListDocumentState({this.itemDoc, this.srNum});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3),
      padding: EdgeInsets.all(3),
      child: Row(children: <Widget>[
        Checkbox(
          checkColor: Colors.red,
          activeColor: Colors.greenAccent,
          value: this.checkValue,
          onChanged: (bool value) {
            setState(() {
              this.checkValue = value;
            });
          },
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

class ListDoc {
  String docType;
  ListDoc(this.docType);
}
