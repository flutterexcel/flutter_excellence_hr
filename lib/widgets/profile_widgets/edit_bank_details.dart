import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_excellence_hr/bloc/profile/profile_bloc.dart';
import 'package:flutter_excellence_hr/model/profile/ProfileDetails.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
//import 'package:universal_io/io.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class EditBankDetails extends StatelessWidget {
  ProfileDetails profileDetails;
  final acNum = TextEditingController();
  final bnkName = TextEditingController();
  final bnkAddress = TextEditingController();
  final ifsc = TextEditingController();

  final RoundedLoadingButtonController _btnControllerz =
      new RoundedLoadingButtonController();
  EditBankDetails({this.profileDetails});

  @override
  Widget build(BuildContext context) {
    final _proflieBloc = BlocProvider.of<ProfileBloc>(context);
    ProfileState state = _proflieBloc.state;
    void _doReset() async {
      Timer(Duration(seconds: 2), () {
        _btnControllerz.reset();
      });
    }

    _dosave() async {
      _proflieBloc.add(SaveProfile(
          acNum: acNum.text,
          bnkAddress: bnkAddress.text,
          bnkName: bnkName.text,
          ifsc: ifsc.text,
          data: this.profileDetails));
      _btnControllerz.success();
      _doReset();
    }

    // Widget _getFAB() {
    //   if (Platform.isWindows) {
    // return ;
    //    } else {
    //     return ;
    //   }
    // }

    return profileDetails.data.userBankDetail != null
        ? Column(
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
                  key: Key('BankAccountNumber'),
                  controller: acNum
                    ..text = profileDetails.data.userBankDetail.bankAccountNo,
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
                  key: Key('BankName'),
                  controller: bnkName
                    ..text = profileDetails.data.userBankDetail.bankName,
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
                  controller: bnkAddress
                    ..text = profileDetails.data.userBankDetail.bankAddress,
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
                  key: Key('IfscCode'),
                  controller: ifsc
                    ..text = profileDetails.data.userBankDetail.ifsc,
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
                    child: RoundedLoadingButton(
                      color: AppColors.BTN_BLACK_COLOR,
                      width: 150,
                      borderRadius: 10,
                      child: Text('Update Bank Details',
                          style: TextStyle(color: Colors.white)),
                      controller: _btnControllerz,
                      onPressed: () {
                        _dosave();
                      },
                    ),
                  ),
                ],
              ),
            ],
          )
        : Center();
  }
}
