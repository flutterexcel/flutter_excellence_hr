part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class ProfileInit extends ProfileEvent {}

class ProfileLoading extends ProfileEvent {}

class SaveProfile extends ProfileEvent {
  final String acNum;
  final String bnkAddress;
  final String bnkName;
  final String ifsc;
  final data;
  SaveProfile(
      {this.acNum, this.bnkAddress, this.bnkName, this.ifsc, this.data});

  @override
  List<Object> get props => [acNum, bnkAddress, bnkName, ifsc, data];
}
