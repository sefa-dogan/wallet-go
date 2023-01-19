import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';

import 'package:flutter_boilerplate/locator.dart';
import 'package:flutter_boilerplate/components/floating_action_button/view/sf_floating_action_button.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_icon_button.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/core/route/app_routes.dart';
import 'package:flutter_boilerplate/store/bottomappbar/sf_bottom_app_bar_store.dart';
import 'package:flutter_boilerplate/store/user/viewmodel/user_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SFBottomAppBar extends StatelessWidget {
  SFBottomAppBar({super.key});

  final viewmodel = locator<SFBottomAppBarStore>();
  final userStore = locator<UserStore>();

  // List routes = [
  //   () => Get.toNamed(AppRoutes.HOME_SCREEN),
  //   () => Get.toNamed(AppRoutes.PAYMENTS_SCREEN),
  //   () => Get.toNamed(AppRoutes.NOTIFICATIONS_LIST_SCREEN),
  //   () => Get.toNamed(AppRoutes.PROFILE_SCREEN)
  // ];

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return BottomAppBar(
        notchMargin: 40,
        shape: const CircularNotchedRectangle(),
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SFIconButton(
                          iconIconButton: Icons.home_filled,
                          iconColor: viewmodel.index == 0
                              ? null
                              : AppColor.appPaleGrey,
                          onPressedIconButton: () async {
                            await userStore.getLastTransactions();

                            Get.offNamed(AppRoutes.HOME_SCREEN);
                          },
                        ),
                        Text(AppStrings.HOME,
                            style: TextStyle(
                                color: viewmodel.index == 0
                                    ? null
                                    : AppColor.appPaleGrey))
                      ],
                    ),
                    Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SFIconButton(
                          iconIconButton: Icons.credit_card_rounded,
                          iconColor: viewmodel.index == 1
                              ? null
                              : AppColor.appPaleGrey,
                          onPressedIconButton: () {
                            Get.offNamed(AppRoutes.PAYMENTS_SCREEN);
                          },
                        ),
                        Text(AppStrings.PAYMENTS,
                            style: TextStyle(
                                color: viewmodel.index == 1
                                    ? null
                                    : AppColor.appPaleGrey))
                      ],
                    )
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  SFFloatingActionButton(),
                  // GestureDetector(
                  //   onTap: () async {
                  //     return showModalBottomSheet(
                  //       shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.vertical(
                  //               top: Radius.circular(AppIntValues.TEN))),
                  //       context: context,
                  //       builder: (context) {
                  //         return Container();
                  //       },
                  //     );
                  //   },
                  //   child: CircleAvatar(
                  //     maxRadius: MediaQuery.of(context).size.width / 12,
                  //     backgroundColor: AppColor.appBlue,
                  //     child: Icon(Icons.add),
                  //   ),
                  // ),
                ],
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        SFIconButton(
                          iconIconButton: Icons.notifications,
                          iconColor: viewmodel.index == 2
                              ? null
                              : AppColor.appPaleGrey,
                          onPressedIconButton: () {
                            Get.offNamed(AppRoutes.NOTIFICATIONS_LIST_SCREEN);
                          },
                        ),
                        Text(AppStrings.NOTIFICATIONS,
                            style: TextStyle(
                                color: viewmodel.index == 2
                                    ? null
                                    : AppColor.appPaleGrey))
                      ],
                    ),
                    Column(
                      children: [
                        SFIconButton(
                          iconIconButton: Icons.account_circle,
                          iconColor: viewmodel.index == 3
                              ? null
                              : AppColor.appPaleGrey,
                          onPressedIconButton: () {
                            Get.offNamed(AppRoutes.PROFILE_SCREEN);
                          },
                        ),
                        Text(
                          AppStrings.PROFILE,
                          style: TextStyle(
                              color: viewmodel.index == 3
                                  ? null
                                  : AppColor.appPaleGrey),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
