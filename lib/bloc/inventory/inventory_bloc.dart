import 'package:bloc/bloc.dart';
import 'package:flutter_excellence_hr/model/inventory/audit_current_month.dart';
import 'package:flutter_excellence_hr/model/inventory/history.dart';
import 'package:flutter_excellence_hr/model/inventory/user_assign_machine.dart';
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
    bool enableoverview = false;
    String comment;
    bool enableInventory = false;
    if (event.enableInventory != null) {
      enableInventory = event.enableInventory;
    }
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
            comment: event.comment,
            enableoverview: event.enableoverview,
            showInventory: enableInventory);
        return;
      }
      final inventory = await invapi.inventory();
      for (var i = 0; i < inventory.userMachine.length; i++) {
        final item = inventory.userMachine[i];
        UserAssignMachine usermachine = UserAssignMachine.fromJson(item);
        AuditCurrentMonthStatus auditStatus = AuditCurrentMonthStatus.fromJson(
            usermachine.auditCurrentMonthStatus.toJson());
        if (auditStatus.status) {
          enableoverview = true;
        } else {
          enableoverview = false;
          count = i;
          break;
        }
      }
      if (enableInventory) enableoverview = false;

      yield InventorySuccess(
          data: inventory,
          count: count,
          enablecomment: enablecomment,
          comment: comment,
          enableoverview: enableoverview,
          showInventory: enableInventory);
    } catch (err) {}
  }

  clearInventory() async* {
    yield InventoryInitial();
  }
}
