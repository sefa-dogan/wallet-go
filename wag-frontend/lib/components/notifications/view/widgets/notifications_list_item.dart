import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/notifications/viewmodel/notifications_viewmodel.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';
import 'package:flutter_boilerplate/locator.dart';

// ignore: must_be_immutable
class NotificationsListItem extends StatefulWidget {
  NotificationsListItem(
      {super.key, required this.notification, required this.itemIndex});

  String notification;
  int itemIndex;

  @override
  State<NotificationsListItem> createState() => _NotificationsListItemState();
}

class _NotificationsListItemState extends State<NotificationsListItem> {
  final edgeInset = const EdgeInsets.all(AppIntValues.TEN);

  final viewmodel = locator<NotificationsViewModel>();
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
              onTap: () {
                setState(() {
                  isPressed = !isPressed;
                });
              },
              child: Container(
                decoration: const BoxDecoration(
                    color: AppColor.appGrey,
                    borderRadius:
                        BorderRadius.all(Radius.circular(AppIntValues.TEN))),
                height: MediaQuery.of(context).size.height * 0.08,
                width: double.infinity,
                margin: edgeInset,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: edgeInset,
                      child: Text(widget.notification),
                    ),
                    AnimatedContainer(
                        decoration: const BoxDecoration(
                            color: AppColor.appBlue,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(AppIntValues.TEN),
                                bottomRight:
                                    Radius.circular(AppIntValues.TEN))),
                        duration: const Duration(seconds: 1),
                        // color: AppColor.appBlue,
                        width: isPressed ? 50 : 0,
                        curve: Curves.fastLinearToSlowEaseIn,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Visibility(
                              visible: isPressed,
                              child: const Icon(
                                Icons.delete,
                                color: AppColor.appWhite,
                                size: 15,
                              ),
                            )
                          ],
                        ))
                  ],
                ),
              )),
        ),
      ],
    );
  }
}
