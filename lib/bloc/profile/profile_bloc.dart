import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../services/profile/profile.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial());
  final Profile profileApi = Profile();
  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    if (event is ProfileLoading) {
      yield* _mapProfileToState(event);
    }
  }

  Stream<ProfileState> _mapProfileToState(ProfileLoading event) async* {
    yield ProfileLoad();
    try {
      final profile = await profileApi.getprofile();
      yield ProfileSuccess(data: profile);
    } on Exception catch (e) {} catch (err) {}
  }
}
