part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoad extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final data;
  ProfileSuccess({this.data});
}
