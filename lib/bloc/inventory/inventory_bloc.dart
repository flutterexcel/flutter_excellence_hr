import 'package:bloc/bloc.dart';
import 'package:flutter_excellence_hr/model/inventory/inventory.dart';
import 'inventory_event.dart';
import 'inventory_state.dart';
import '../../services/get_inventory.dart';

class InventoryBloc extends Bloc<InventoryEvent, InventoryState> {
  InventoryBloc(InventoryState initialState) : super(initialState);

  InventoryState get initialState => InventoryInitial();

  final Inventory invapi = Inventory();
  @override
  Stream<InventoryState> mapEventToState(InventoryEvent event) async* {
    if (event is UserInventory) {
      yield InventoryInitial();
    }
    if (event is LoadInventory) {
      yield* _mapUserInventoryToState(event);
    }
  }

  Stream<InventoryState> _mapUserInventoryToState(LoadInventory event) async* {
    yield InventoryLoading();

    try {
      print('get');
      final inventory = await invapi.inventory();
      yield InventorySuccess(data: inventory);
      ;
    } on Exception catch (e) {} catch (err) {}
  }
}
