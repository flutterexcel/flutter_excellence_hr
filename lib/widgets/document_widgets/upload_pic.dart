import 'dart:convert';
import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_excellence_hr/services/profile/upload_image.dart';
import 'package:flutter_excellence_hr/widgets/document_widgets/document_dropdown.dart';
import 'package:flutter_excellence_hr/widgets/document_widgets/document_widgets.dart';
import 'package:image_picker/image_picker.dart';

class UploadDocumentPic extends StatefulWidget {
  String document = '-';
  final Function(String) onImgUpload;

  UploadDocumentPic({this.document, this.onImgUpload});
  @override
  _UploadDocumentPicState createState() => _UploadDocumentPicState(
      document: this.document,
      onImgUpload: (String val) {
        onImgUpload(val);
      });
}

class _UploadDocumentPicState extends State<UploadDocumentPic> {
  String document = '-';
  bool valuefirst = false;
  final Function(String) onImgUpload;
  _UploadDocumentPicState({this.document, this.onImgUpload});
  File _image;
  var val;
  UploadImage api = UploadImage();
  UploadImg uploadImg;
  DropDown dropDown = new DropDown();
  DocumentListing documentListing;
  bool uploading = true;

  Future getImage() async {
    final image = await ImagePicker.pickImage(source: ImageSource.gallery);
    _image = image;
    setState(() {
      if (_image.path.isNotEmpty) uploading = false;
    });
    try {
      await api
          .uploadImage(
        doctype: widget.document,
        action: "user_document",
        file: _image,
      )
          .then((value) {
        val = jsonDecode(value.body);
      
        if (val['error'] == 0) {
          onImgUpload(widget.document);
        }
      });

      alertDialog();
    } catch (e) {}
  }

  mytest() {
    setState(() {
      onImgUpload(document);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          getImage();
          //mytest();
        },
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(8),
              child: DottedBorder(
                borderType: BorderType.RRect,
                color: Colors.grey,
                radius: Radius.circular(0),
                padding: EdgeInsets.all(6),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  child: Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: uploading
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                " Click to select file to upload Image",
                                style: TextStyle(
                                    color: AppColors.MIDIUM_BLACK,
                                    fontFamily: 'OpenSans'),
                              )
                            ],
                          )
                        : Center(
                            child: CircularProgressIndicator(),
                          ),
                  ),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Checkbox(
                  checkColor: Colors.red,
                  activeColor: Colors.greenAccent,
                  value: this.valuefirst,
                  onChanged: (bool value) {
                    setState(() {
                      this.valuefirst = value;
                    });
                  },
                ),
                Flexible(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: Text(
                        'By uploading this document you certify that these documents are true and all information is correct',
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 12,
                        )),
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  void alertDialog() {
    var alert = AlertDialog(
      title: Text('Your Document Uploaded'),
      content: Text(val['message']),
      actions: <Widget>[
        FlatButton(
            onPressed: () {
              setState(() {
                uploading = true;
                Navigator.of(context).pop();
              });
            },
            child: Text(
              'OK',
              style: TextStyle(fontSize: 20),
            ))
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext c) {
          return alert;
        });
  }
}
