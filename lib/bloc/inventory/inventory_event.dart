import 'package:equatable/equatable.dart';

class InventoryEvent extends Equatable {
  List<Object> get props => [];
}

class UserInventory extends InventoryEvent {}

class LoadInventory extends InventoryEvent {}
