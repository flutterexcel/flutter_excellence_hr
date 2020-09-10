import 'package:flutter/material.dart';
import 'package:flutter_excellence_hr/screens/navigate/navigate.dart';
import 'package:flutter_excellence_hr/widgets/appbar.dart';
import 'package:flutter_excellence_hr/widgets/profile_widgets/bank_details.dart';
import 'package:flutter_excellence_hr/widgets/profile_widgets/edit_bank_details.dart';
import 'package:flutter_excellence_hr/widgets/profile_widgets/profile_widgets.dart';

class MyProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      appBar: AppBar(
        title: AppBarWidget(
          pageName: "Edit profile",
        ),
      ),
      drawer: Navigation(),
      body: SafeArea(      
          child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            EditNotice(),
            IdCard(name: " Shubham Mishra", designation:"Jr.Mobile App Developer", empId:"523",joinDate:"2020-08-10",workEmail: "shubham@excellence.in",gender: "Male",dob: "1997-09-06",contact: "9999999988",),
            PersonDetails(),
            PersonAddress(),
            BankDetails(),
            EditBankDetails(),
            UpdatePassword(),
            EnterPassword(),
            ProfilePicture(),
            UploadPic(),              
          ],
        ),
      )),
    );
  }
}
