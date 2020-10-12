import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_excellence_hr/widgets/appbar.dart';
import '../../bloc/profile/profile_bloc.dart';
import '../../model/profile/ProfileDetails.dart';
import '../../screens/navigate/navigate.dart';
import 'package:flutter_excellence_hr/widgets/profile_widgets/bank_details.dart';
import 'package:flutter_excellence_hr/widgets/profile_widgets/edit_bank_details.dart';
import 'package:flutter_excellence_hr/widgets/profile_widgets/profile_widgets.dart';

class ShowProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _proflieBloc = BlocProvider.of<ProfileBloc>(context);

    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoad) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
                child: CircularProgressIndicator(backgroundColor: Colors.cyan)),
          );
          // return Center(
          //   child: CircularProgressIndicator(),
          // );
        }
        if (state is ProfileInitial) {
          _proflieBloc.add(ProfileLoading());
        }

        return Scaffold(
            appBar: AppBar(
                title: AppBarWidget(
              pageName: "My Profile",
            )),
            drawer: Navigation(),
            body: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: <Widget>[
                    if (state is ProfileSuccess) ...{
                      ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            ProfileDetails profileDetails =
                                ProfileDetails.fromJson(state.data.toJson());
                            return Column(
                              children: <Widget>[
                                EditNotice(),
                                IdCard(profileDetails: profileDetails),
                                PersonDetails(),
                                PersonAddress(profileDetails: profileDetails),
                                BankDetails(),
                                EditBankDetails(profileDetails: profileDetails),
                                UpdatePassword(),
                                EnterPassword(),
                                ProfilePicture(),
                                UploadPic(),
                              ],
                            );
                          }),
                    }
                  ],
                ),
              ),
            ));
      },
    );
  }
}
