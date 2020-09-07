import 'package:equatable/equatable.dart';

class InventoryDetails extends Equatable {
  final userMachine;
  final userProfile;

  const InventoryDetails({this.userMachine, this.userProfile});

  @override
  List<Object> get props => [userMachine, userProfile];

  static InventoryDetails fromJson(dynamic json) {
    return InventoryDetails(
      userMachine: json["data"]['user_assign_machine'],
      userProfile: json["data"]['user_profile_detail'],
    );
  }

  //String toString() => '{ user_profile: $user_profile }';
}
