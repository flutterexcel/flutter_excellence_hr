import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_excellence_hr/services/document/mydocument.dart';
import '../../model/document/document_list.dart';

class DocumentListing extends StatefulWidget {
  @override
  _DocumentListingState createState() => _DocumentListingState();
}

class _DocumentListingState extends State<DocumentListing> {
  MyDocument api = new MyDocument();
  DocumentList documentList;
  bool documentLists = false;
  List<String> listAll = [
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

  List<String> listOf = [];
  List<String> result = [];
  List<String> diff = [];
  _getDocumentList() async {
    return await api.getDocument().then((value) {
      documentList = value;
      print("Document list is $value");
      int i = 0;
      // creates an empty array of length 5
      // assignig values to all the indices
      while (i < documentList.data.userDocumentInfo.length) {
        listOf
            .add(documentList.data.userDocumentInfo[i].documentType.toString());
        i++;
      }
      result = LinkedHashSet<String>.from(listOf).toList();
      listAll.forEach((element) {
        if (!result.contains(element)) {
          diff.add(element);
        }
      });
      print("Document need to be uploaded $diff");
      setState(() {
        documentLists = true;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getDocumentList();
  }

  @override
  Widget build(BuildContext context) {
    //listOf.add("CV");
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(6, 6, 6, 4),
          padding: EdgeInsets.all(6),
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            separatorBuilder: (BuildContext context, int index) => Divider(
              height: 1,
              thickness: .5,
              color: Colors.grey[300],
            ),
            itemBuilder: (_, int index) => ListRequiredDocument(result[index]),
            itemCount: result.length,
          ),
        ),
        Divider(
          color: Colors.grey[300],
          height: 1,
          thickness: .5,
          indent: 12,
          endIndent: 12,
        ),
        Container(
          margin: EdgeInsets.fromLTRB(6, 1, 6, 6),
          padding: EdgeInsets.all(6),
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            separatorBuilder: (BuildContext context, int index) => Divider(
              height: 1,
              thickness: .5,
              color: Colors.grey[300],
            ),
            itemBuilder: (_, int index) => ListNotUploadedDocument(diff[index]),
            itemCount: diff.length,
          ),
        ),
      ],
    );
  }
}

class ListRequiredDocument extends StatelessWidget {
  String itemName;
  ListRequiredDocument(this.itemName);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(6),
        child: ListTile(
          leading: Icon(
            Icons.done_all,
            color: Colors.greenAccent,
          ),
          title: Text(
            itemName,
            style: TextStyle(fontSize: 16, fontFamily: 'SourceSans'),
          ),
        ));
  }
}

class ListNotUploadedDocument extends StatelessWidget {
  String itemName;
  ListNotUploadedDocument(this.itemName);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(6),
        child: ListTile(
          leading: Icon(
            Icons.done_all,
            color: AppColors.LIGHTBLACK_COLOR,
          ),
          title: Text(
            itemName,
            style: TextStyle(fontSize: 16, fontFamily: 'SourceSans'),
          ),
        ));
  }
}
