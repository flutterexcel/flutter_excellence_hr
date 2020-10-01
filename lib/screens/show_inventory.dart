import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_excellence_hr/model/inventory/history.dart';
import 'package:flutter_excellence_hr/model/inventory/user_profile_detail.dart';
import 'package:flutter_excellence_hr/resources/app_colors.dart';
import '../bloc/inventory/inventory.dart';
import '../model/inventory/user_assign_machine.dart';
import '../widgets/navigate/imp_notes_inventory.dart';
import '../screens/navigate/navigate.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ShowInventory extends StatelessWidget {
  //final Inventory api = Inventory();
  final commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _inventoryBloc = BlocProvider.of<InventoryBloc>(context);

    return BlocBuilder<InventoryBloc, InventoryState>(
      builder: (context, state) {
        if (state is InventoryLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is InventoryInitial) {
          _inventoryBloc.add(LoadInventory());
        }

        return Scaffold(
            appBar: AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('My Inventory',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/images/person.jpg'))
                ],
              ),
            ),
            drawer: Navigation(),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                // Add your onPressed code here!
              },
              label: Text('Assign Device'),
              backgroundColor: AppColors.GREEN_COLOR,
            ),
            body: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: <Widget>[
                    if (state is InventorySuccess) ...{
                      state.enableoverview
                          ? Overview()
                          : Column(
                              children: <Widget>[
                                Center(
                                  child: ImportantNotesInventory(),
                                ),
                                ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  // Let the ListView know how many items it needs to build.
                                  itemCount: state.data.userMachine.length,
                                  // Provide a builder function. This is where the magic happens.
                                  // Convert each item into a widget based on the type of item it is.
                                  itemBuilder: (context, index) {
                                    final item = state.data.userMachine[index];
                                    UserAssignMachine usermachine =
                                        UserAssignMachine.fromJson(item);
                                    return AnimationConfiguration.staggeredList(
                                        position: index,
                                        duration:
                                            const Duration(milliseconds: 1000),
                                        child: SlideAnimation(
                                          verticalOffset: 50.0,
                                          child: FadeInAnimation(
                                            child: InventoryList(
                                                usermachine, index, state.data),
                                          ),
                                        ));
                                  },
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: 1,
                                    itemBuilder: (context, index) {
                                      final itemmachine =
                                          state.data.userMachine[state.count];

                                      UserAssignMachine usermachine =
                                          UserAssignMachine.fromJson(
                                              itemmachine);
                                      final itemuser = state.data.userProfile;
                                      UserProfileDetail userprofile =
                                          UserProfileDetail.fromJson(itemuser);

                                      return InventoryDetails(
                                          usermachine, userprofile);
                                    }),
                                SizedBox(
                                  height: 20,
                                ),
                                CommentForm(state),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        margin:
                                            EdgeInsets.fromLTRB(16, 16, 8, 16),
                                        child: Text(
                                          'Recent Comments',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: AppColors.LIGHTBLACK_COLOR,
                                              fontSize: 25,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(
                                  height: 2,
                                  endIndent: 16,
                                  indent: 16,
                                  thickness: 2,
                                  color: AppColors.COMMENT_ICON,
                                ),
                                ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: 5,
                                  itemBuilder: (context, index) {
                                    final itemmachine =
                                        state.data.userMachine[state.count];

                                    UserAssignMachine usermachine =
                                        UserAssignMachine.fromJson(itemmachine);
                                    final itemuser = state.data.userProfile;
                                    UserProfileDetail userprofile =
                                        UserProfileDetail.fromJson(itemuser);
                                    final item = usermachine.history[index];
                                    History userhistory =
                                        History.fromJson(item.toJson());
                                    return RecentComments(
                                        userprofile, userhistory);
                                  },
                                ),
                              ],
                            )
                    }
                  ],
                ),
              ),
            ));
      },
    );
  }
}
