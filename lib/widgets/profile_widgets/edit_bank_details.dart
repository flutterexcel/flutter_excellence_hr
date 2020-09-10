import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:universal_io/io.dart';

class EditBankDetails extends StatelessWidget {
  final acNum = TextEditingController();
  final bnkName = TextEditingController();
  final bnkAddress = TextEditingController();
  final Ifsc = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Widget _getFAB() {
      if (Platform.isWindows) {
        return RaisedButton(
          onPressed: () {},
          color: AppColors.BTN_BLUE,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          textColor: Colors.white,
          child: Text(
            "Update Bank Details",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 18,
            ),
          ),
        );
      } else {
        RaisedButton(
          onPressed: () {},
          color: AppColors.BTN_BLUE,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          textColor: Colors.white,
          child: Text(
            "Update Bank Details",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 18,
            ),
          ),
        );
      }
    }

    return Column(
      children: <Widget>[
        Row(
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  "Bank Account Number",
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 18,
                      color: AppColors.MIDIUM_BLACK),
                )),
          ],
        ),
        Container(
          margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
          height: 35,
          child: TextFormField(
            controller: acNum,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Row(
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  "Bank Name",
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 18,
                      color: AppColors.MIDIUM_BLACK),
                )),
          ],
        ),
        Container(
          margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
          height: 35,
          child: TextFormField(
            controller: bnkName,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Row(
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  "Bank Address",
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 18,
                      color: AppColors.MIDIUM_BLACK),
                )),
          ],
        ),
        Container(
          margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
          height: 35,
          child: TextFormField(
            controller: bnkAddress,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Row(
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  "IFSC Code",
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 18,
                      color: AppColors.MIDIUM_BLACK),
                )),
          ],
        ),
        Container(
          margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
          height: 35,
          child: TextFormField(
            controller: Ifsc,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 35,
              margin: EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: _getFAB(),
            ),
          ],
        ),
      ],
    );
  }
}
