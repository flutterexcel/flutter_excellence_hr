import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_excellence_hr/model/profile/ProfileDetails.dart';
import '../../services/profile/profile.dart';
import '../../services/profile/update_bank_details.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial());
  final Profile profileApi = Profile();
  final UpdateBankDetails updateBankDetails = UpdateBankDetails();
  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    if (event is ProfileInit) {
      yield ProfileInitial();
    }
    if (event is ProfileLoading) {
      yield* _mapProfileToState(event);
    }

    if (event is SaveProfile) {
      yield* _mapSaveProfileToState(event);
    }
  }

  Stream<ProfileState> _mapProfileToState(ProfileLoading event) async* {
    yield ProfileLoad();
    try {
      final profile = await profileApi.getprofile();
      yield ProfileSuccess(
          data: profile, profileSaved: false, profileError: false);
    } on Exception {} catch (err) {}
  }

  Stream<ProfileState> _mapSaveProfileToState(SaveProfile event) async* {
    try {
      final profile = await updateBankDetails.updateBankDetails(
          event.acNum, event.bnkAddress, event.bnkName, event.ifsc);
      yield ProfileSuccess(
          data: event.data, profileSaved: true, profileError: false);
      if (profile.error == 1) {
        yield ProfileSuccess(
            data: event.data, profileSaved: false, profileError: true);
      }
    } on Exception catch (e) {
      yield ProfileSuccess(
          data: event.data, profileSaved: false, profileError: true);
    } catch (err) {
      yield ProfileSuccess(
          data: event.data, profileSaved: false, profileError: true);
    }
  }
}
