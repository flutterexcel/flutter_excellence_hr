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
  InventorySuccess({this.data, this.count, this.enablecomment, this.comment});
  List<Object> get props => [count, enablecomment, comment];
}

class InventoryFailure extends InventoryState {}

class InventoryInitial extends InventoryState {}

class ShowHistory extends InventoryState {
  final history;
  ShowHistory({this.history});
}
