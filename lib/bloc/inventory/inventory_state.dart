import 'package:equatable/equatable.dart';
import '../../model/inventory/inventory.dart';

class InventoryState extends Equatable {
  List<Object> get props => [];
}

class GetInventory extends InventoryState {}

class InventoryLoading extends InventoryState {}

class InventorySuccess extends InventoryState {
  final InventoryDetails data;
  int count = 0;
  bool enablecomment = false;
  String comment;
  bool enableoverview = false;
  bool showInventory = false;
  InventorySuccess(
      {this.data,
      this.count,
      this.enablecomment,
      this.comment,
      this.enableoverview,
      this.showInventory});
  List<Object> get props => [count, enablecomment, comment, enableoverview];
}

class InventoryFailure extends InventoryState {}

class InventoryInitial extends InventoryState {}

class ShowHistory extends InventoryState {
  final history;
  ShowHistory({this.history});
}
