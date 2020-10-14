import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_excellence_hr/services/document/mydocument.dart';
import '../../model/document/document_list.dart';

class DocumentLists extends StatefulWidget {
  @override
  _DocumentListsState createState() => _DocumentListsState();
}

class _DocumentListsState extends State<DocumentLists> {
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

  MyDocument api = MyDocument();
  DocumentList documentList;
  bool show = false;
  List<ListDocument> list = [];

  List<bool> listBool = [
    true,
    false,
    true,
    false,
    true,
    false,
    true,
    true,
    true,
    true,
    true,
    true,
  ];

  _getDocumentList() async {
    return await api.getDocument().then((value) {
      documentList = value;
      print("Your value $value");
      int i = 0;

      // documentList.data.userDocumentInfo[0].documentType.contains("CV")
      //     ? listBool.add(true)
      //     : listBool.add(false);
      // documentList.data.userDocumentInfo[1].documentType.contains("PAN Card")
      //     ? listBool.add(true)
      //     : listBool.add(false);
      // documentList.data.userDocumentInfo[2].documentType
      //         .contains("Address Proof")
      //     ? listBool.add(true)
      //     : listBool.add(false);
      // documentList.data.userDocumentInfo[3].documentType
      //         .contains("Offer Letter")
      //     ? listBool.add(true)
      //     : listBool.add(false);
      // documentList.data.userDocumentInfo[4].documentType
      //         .contains("Appointment Letter")
      //     ? listBool.add(true)
      //     : listBool.add(false);
      // documentList.data.userDocumentInfo[5].documentType
      //         .contains("Previous Company Experience Letter")
      //     ? listBool.add(true)
      //     : listBool.add(false);
      // documentList.data.userDocumentInfo[6].documentType
      //         .contains("Previous Company Offer Letter")
      //     ? listBool.add(true)
      //     : listBool.add(false);
      // documentList.data.userDocumentInfo[7].documentType
      //         .contains("Previous Company Salary Slip")
      //     ? listBool.add(true)
      //     : listBool.add(false);
      // documentList.data.userDocumentInfo[8].documentType
      //         .contains("Previous Company Other Documents")
      //     ? listBool.add(true)
      //     : listBool.add(false);
      // documentList.data.userDocumentInfo[9].documentType
      //         .contains("Qualification Certificate")
      //     ? listBool.add(true)
      //     : listBool.add(false);
      // documentList.data.userDocumentInfo[10].documentType
      //         .contains("Other Documents")
      //     ? listBool.add(true)
      //     : listBool.add(false);
      // documentList.data.userDocumentInfo[11].documentType
      //         .contains("Other Documents")
      //     ? listBool.add(true)
      //     : listBool.add(false);
    });
  }

  @override
  void initState() {
    super.initState();
    _getDocumentList();
  }

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
              ListDocument(this.listOf[index], this.listBool[index]),
          itemCount: this.listOf.length,
        ),
      ),
    );
  }
}

class ListDocument extends StatefulWidget {
  String itemDoc;
  bool checkValue = false;
  ListDocument(this.itemDoc, this.checkValue);
  @override
  _ListDocumentState createState() =>
      _ListDocumentState(itemDoc: itemDoc, checkValue: checkValue);
}

class _ListDocumentState extends State<ListDocument> {
  String itemDoc;
  bool checkValue = false;
  _ListDocumentState({this.itemDoc, this.checkValue});
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
              //    this.checkValue = value;
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
