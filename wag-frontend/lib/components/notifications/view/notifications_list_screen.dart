import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_bottom_app_bar.dart';
import 'package:flutter_boilerplate/components/notifications/view/widgets/notifications_list_item.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/locator.dart';
import 'package:flutter_boilerplate/store/bottomappbar/viewmodel/sf_bottom_app_bar_store.dart';

// ignore: must_be_immutable
class NotificationsListScreen extends StatelessWidget {
  NotificationsListScreen({super.key});
  final bottomAppBarviewmodel = locator<SFBottomAppBarStore>();
  List<String> notifications = [
    "notification1",
    "notification2",
    "notification3"
  ];

  @override
  Widget build(BuildContext context) {
    bottomAppBarviewmodel.index = 2;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        shadowColor: AppColor.appTransparent,
        title:  Text(AppStrings.NOTIFICATIONS,
            style: const TextStyle(color: AppColor.appBlack)),
        backgroundColor: AppColor.appWhite,
      ),
      backgroundColor: AppColor.appWhite,
      floatingActionButton: const SizedBox(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: SFBottomAppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                return NotificationsListItem(
                  notification: notifications[index],
                  itemIndex: index,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
