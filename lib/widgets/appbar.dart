import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_excellence_hr/bloc/attendance/attendance_bloc.dart';
import 'package:flutter_excellence_hr/bloc/inventory/inventory_bloc.dart';
import 'package:flutter_excellence_hr/bloc/inventory/inventory_event.dart';
import 'package:flutter_excellence_hr/bloc/profile/profile_bloc.dart';
import 'package:flutter_excellence_hr/model/profile/ProfileDetails.dart';
import 'package:flutter_excellence_hr/services/profile/profile.dart';
import 'package:flutter_excellence_hr/services/storage_service.dart';

class AppBarWidget extends StatefulWidget {
  final pageName;
  AppBarWidget({this.pageName});
  @override
  _AppBarWidgetState createState() => _AppBarWidgetState(pageName: pageName);
}

class _AppBarWidgetState extends State<AppBarWidget> {
  String pageName;
  _AppBarWidgetState({this.pageName});

  Profile api = new Profile();
  ProfileDetails profileDetails;
  bool profileImg = false;
  _getProfile() async {
    return await api.getprofile().then((value) {
      profileDetails = value;
      StorageUtil.setProfileImg(
          profileDetails.data.userProfileDetail.profileImage);
      setState(() {
        profileImg = true;
      });
    });
  }

  @override
  void initState() {
    super.initState();
   if (StorageUtil.getProfileImg() == "") {
     _getProfile();
     BlocProvider.of<InventoryBloc>(context).add(UserInventory());
      BlocProvider.of<ProfileBloc>(context).add(ProfileInit());
      BlocProvider.of<AttendanceBloc>(context).add(AttendanceInit());
   } else {
      setState(() {
        profileImg = true;
      });
  }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(pageName,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold)),
        profileImg
            ? CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(StorageUtil.getProfileImg()))
            : Center()
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
