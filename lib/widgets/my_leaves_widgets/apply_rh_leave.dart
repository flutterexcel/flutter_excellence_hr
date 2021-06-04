import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import 'package:flutter_excellence_hr/services/leave/apply_rh.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class ApplyRhLeave extends StatelessWidget {
  String rhName;
  String date;
  String _message;
  ApplyRhLeave(this.rhName, this.date);
  ApplyRh _api = ApplyRh();
  var _error;
  Future _applyLeave() async {
    await _api.applyRhLeave(date, date, reason.text).then((value) {
      _error = value.error;
      _message = value.data.message;
      _btnController.success();

      _doReset();
    });
  }

  void _doReset() async {
    Timer(Duration(seconds: 2), () {
      _btnController.reset();
    });
  }

  void _popupDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
              child: Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: _error==1?
            Column(
              children: <Widget>[
              
              SizedBox(height: 20),
              CircleAvatar(
                backgroundColor: Colors.red,
                radius:40,
                child: Icon(Icons.clear,size: 60, ),
                ),
              SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                    _message,
                    style: TextStyle(
                        color: AppColors.THEME_COLOR,
                        fontSize: 26,
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.bold),
                  ),
              ),
              
              
            ],)
            :Column(children: <Widget>[
              SizedBox(height: 20),
              CircleAvatar(
                backgroundColor: Colors.red,
                radius:40,
                child: Icon(
                  Icons.done,
                  size: 60.0,),
                ),
              SizedBox(height: 20),
              Text(
                'Leave Applied Succesfully',
                style: TextStyle(
                    color: AppColors.THEME_COLOR,
                    fontSize: 26,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                  _message,
                  style: TextStyle(
                      color: AppColors.THEME_COLOR,
                      fontSize: 26,
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.bold),
                ),
              
              
            ],)
            
          ));
        });
  }

  final reason = TextEditingController();
  final RoundedLoadingButtonController _btnController =
      new RoundedLoadingButtonController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 300,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(height: 10),
            Text(
              "RH Name: $rhName",
              style: TextStyle(
                  color: AppColors.THEME_COLOR,
                  fontSize: 16,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Date: $date",
              style: TextStyle(
                  color: AppColors.THEME_COLOR,
                  fontSize: 16,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Reason for RH: ",
              style: TextStyle(
                  color: AppColors.THEME_COLOR,
                  fontSize: 16,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                key: Key('reasonKey'),
                enabled: true,
                controller: reason,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "",
                    labelStyle: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                        fontSize: 16)),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.all(8),
              width: 80,
              child: RoundedLoadingButton(
                color: AppColors.BTN_BLACK_COLOR,
                width: 110,
                borderRadius: 10,
                controller: _btnController,
                onPressed: () {
                  _applyLeave().whenComplete(() {
                    _popupDialog(context);
                  });
                },
                child: Text('Apply Rh', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
