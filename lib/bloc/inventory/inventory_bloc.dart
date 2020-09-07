import 'package:bloc/bloc.dart';
import 'inventory_event.dart';
import 'inventory_state.dart';
import '../../services/inventory/get_inventory.dart';

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
    if (event is InventoryHistory) {
      yield* _mapShowInventoryToState(event);
    }
  }

  Stream<InventoryState> _mapShowInventoryToState(
      InventoryHistory event) async* {
    yield ShowHistory(history: event.history);
  }

  Stream<InventoryState> _mapUserInventoryToState(LoadInventory event) async* {
    int count = 0;
    bool enablecomment = false;
    String comment;

    if (event.count != null) {
      count = event.count;
    } else {
      yield InventoryLoading();
    }
    try {
      if (event.data != null) {
        yield InventorySuccess(
            data: event.data,
            count: count,
            enablecomment: event.enablecomment,
            comment: event.comment);
        return;
      }
      final inventory = await invapi.inventory();
      yield InventorySuccess(
          data: inventory,
          count: count,
          enablecomment: enablecomment,
          comment: comment);
    } on Exception catch (e) {} catch (err) {}
  }
}
