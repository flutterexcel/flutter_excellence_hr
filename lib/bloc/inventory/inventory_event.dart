import 'package:equatable/equatable.dart';
import '../../model/inventory/inventory.dart';

class InventoryEvent extends Equatable {
  List<Object> get props => [];
}

class UserInventory extends InventoryEvent {}

class LoadInventory extends InventoryEvent {
  int count = 0;
  InventoryDetails data;
  bool enablecomment = false;
  String comment;
  bool enableoverview = false;
  bool enableInventory = false;
  LoadInventory(
      {this.data,
      this.count,
      this.enablecomment,
      this.comment,
      this.enableoverview,
      this.enableInventory});
}

class InventoryHistory extends InventoryEvent {
  final history;
  InventoryHistory({this.history});
}
