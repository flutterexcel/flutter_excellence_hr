part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];

  Object get profileSaved => false;
  Object get profileError => false;
}

class ProfileInitial extends ProfileState {}

class ProfileLoad extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final data;
  bool profileSaved = false;
  bool profileError = false;

  ProfileSuccess({this.data, this.profileSaved, this.profileError});
  List<Object> get props => [profileSaved, profileError, data];
}

class ProfileSaved extends ProfileState {
  bool profileSaved = false;
  bool profileError = false;
  final data;
  ProfileSaved({this.profileSaved, this.profileError, this.data});
  List<Object> get props => [profileSaved, profileError, data];
}
