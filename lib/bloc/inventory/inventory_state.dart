import 'package:equatable/equatable.dart';
import '../../model/inventory/inventory.dart';

class InventoryState extends Equatable {
  List<Object> get props => [];
}

class GetInventory extends InventoryState {}

class InventoryLoading extends InventoryState {}

class InventorySuccess extends InventoryState {
  final InventoryDetails data;
  InventorySuccess({this.data});
}

class InventoryFailure extends InventoryState {}

class InventoryInitial extends InventoryState {}
