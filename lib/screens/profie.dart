import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/profile/profile_bloc.dart';
import '../model/profile/ProfileDetails.dart';
import '../screens/navigate/navigate.dart';

class ShowProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _proflieBloc = BlocProvider.of<ProfileBloc>(context);

    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoad) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ProfileInitial) {
          _proflieBloc.add(ProfileLoading());
        }

        return Scaffold(
            appBar: AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('My Profile',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/images/person.jpg'))
                ],
              ),
            ),
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

                            // UserProfileDetail userProfileDetail =
                            //     UserProfileDetail.fromJson(state.data.toJson());
                            print(state.data.toJson());
                            print('-----------------------');
                            print(profileDetails.data.userBankDetail.bankName);
                            return Text(
                                profileDetails.data.userBankDetail.bankAddress);
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
