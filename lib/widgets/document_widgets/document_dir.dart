import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_excellence_hr/services/document/mydocument.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../model/document/document_list.dart';

class DocumentDirectory extends StatefulWidget {
  final Function function;
  DocumentDirectory({Key key, this.function}) : super(key: key);
  @override
  DocumentDirectoryState createState() => DocumentDirectoryState();
}

class DocumentDirectoryState extends State<DocumentDirectory> {
  MyDocument api = new MyDocument();
  DocumentList documentList;
  bool yourDocuments = false;
  List<ListItemDoc> documents = [];

  getDocument() async {
    return await api.getDocument().then((value) {
      documentList = value;
      int i = 0;
      while (i < documentList.data.userDocumentInfo.length) {
        documents.add(ListItemDoc(
            documentList.data.userDocumentInfo[i].documentType,
            documentList.data.userDocumentInfo[i].lastModified.toString()));
        i++;
      }
      setState(() {
        yourDocuments = true;
      });
      
    });
  }

  @override
  void initState() {
    super.initState();
    getDocument();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(8, 32, 0, 16),
                child: Text(
                  "DOCUMENT VIEW ",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'SourceSans',
                      fontWeight: FontWeight.bold),
                )),
            Container(
                margin: EdgeInsets.fromLTRB(8, 32, 0, 16),
                child: Text(
                  "TYPE",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'SourceSans',
                      fontWeight: FontWeight.bold),
                )),
            Container(
                margin: EdgeInsets.fromLTRB(8, 32, 0, 16),
                child: Text(
                  "LAST MODIFIED",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'SourceSans',
                      fontWeight: FontWeight.bold),
                )),
          ],
        ),
        yourDocuments
            ? Container(
                margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey[300])),
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
                  itemBuilder: (_, int index) => ListDocumentItems(
                      documents[index],
                      documentList.data.userDocumentInfo[index]),
                  itemCount: documents.length,
                ),
              )
            : Container(),
      ],
    );
  }
}

class ListDocumentItems extends StatelessWidget {
  ListItemDoc itemName;
  UserDocumentInfo data;
  ListDocumentItems(this.itemName, this.data);

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(6),
        child: ListTile(
          leading: InkWell(
            onTap: () {
              _launchURL(data.docLink);
            },
            child: Image.asset(
              'assets/images/doc.png',
              width: 70,
              height: 50,
            ),
          ),
          title: Text(
            itemName.docType,
            style: TextStyle(fontSize: 16, fontFamily: 'SourceSans'),
          ),
          trailing: Text(itemName.updated,
              style: TextStyle(
                  color: AppColors.LIGHTBLACK_COLOR,
                  fontSize: 14,
                  fontFamily: 'SourceSans')),
        ));
  }
}

class ListItemDoc {
  String docType;
  String updated;
  ListItemDoc(this.docType, this.updated);
}
