import 'dart:collection';

import 'package:flutter/material.dart';
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

  List<String> listOf = [];
  List<String> result = [];
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
          margin: EdgeInsets.all(6),
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
