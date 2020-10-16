import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_excellence_hr/services/document/mydocument.dart';
import 'package:flutter_excellence_hr/widgets/document_widgets/document_widgets.dart';
import '../../model/document/document_list.dart';

class DocumentListing extends StatefulWidget {
  String document;
  DocumentListing({this.document});
  @override
  _DocumentListingState createState() =>
      _DocumentListingState(document: this.document);
}

class _DocumentListingState extends State<DocumentListing> {
  MyDocument api = new MyDocument();
  DocumentList documentList;
  bool documentLists = false;
  String document;
  _DocumentListingState({this.document});

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
      int i = 0;
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
    return documentLists
        ? Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(6, 6, 6, 4),
                padding: EdgeInsets.all(6),
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(
                    height: 1,
                    thickness: .5,
                    color: Colors.grey[300],
                  ),
                  itemBuilder: (_, int index) =>
                      ListRequiredDocument(result[index], widget.document),
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
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(
                    height: 1,
                    thickness: .5,
                    color: Colors.grey[300],
                  ),
                  itemBuilder: (_, int index) =>
                      ListNotUploadedDocument(diff[index], widget.document),
                  itemCount: diff.length,
                ),
              ),
            ],
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}

class ListRequiredDocument extends StatelessWidget {
  String itemName, document;
  ListRequiredDocument(this.itemName, this.document);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(6),
        child: ListTile(
          leading: Icon(
            Icons.done_all,
            color:
                itemName == document ? Colors.pinkAccent : Colors.greenAccent,
          ),
          title: Text(
            itemName,
            style: TextStyle(fontSize: 16, fontFamily: 'SourceSans'),
          ),
        ));
  }
}

class ListNotUploadedDocument extends StatelessWidget {
  String itemName, document;
  ListNotUploadedDocument(this.itemName, this.document);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(6),
        child: ListTile(
          leading: Icon(
            Icons.done_all,
            color: (itemName == document)
                ? Colors.greenAccent
                : (AppColors.LIGHTBLACK_COLOR),
          ),
          title: Text(
            itemName,
            style: TextStyle(fontSize: 16, fontFamily: 'SourceSans'),
          ),
        ));
  }
}
