import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_bottom_app_bar.dart';
import 'package:flutter_boilerplate/components/profile/view/widgets/profile_list.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';
import 'package:flutter_boilerplate/core/constants/shared_preferences.dart';
import 'package:flutter_boilerplate/core/route/app_routes.dart';
import 'package:flutter_boilerplate/locator.dart';
import 'package:flutter_boilerplate/store/bottomappbar/sf_bottom_app_bar_store.dart';
import 'package:flutter_boilerplate/store/user/viewmodel/user_store.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';

class ProfileListScreen extends StatelessWidget {
  ProfileListScreen({super.key});

  final bottomAppBarviewmodel = locator<SFBottomAppBarStore>();
  final userStore = locator<UserStore>();
  @override
  Widget build(BuildContext context) {
    bottomAppBarviewmodel.index = 3;
    return Scaffold(
      backgroundColor: AppColor.appWhite,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const SizedBox(),
      bottomNavigationBar: SFBottomAppBar(),
      body: Column(children: [
        Column(
          children: [
            Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  color: AppColor.appBlue,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(AppIntValues.TEN),
                      bottomLeft: Radius.circular(AppIntValues.TEN))),
              child: SizedBox(
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(child: Row(children: const [])),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              alignment: Alignment.topLeft,
                              child: IconButton(
                                  padding: const EdgeInsets.all(5),
                                  color: AppColor.appWhite,
                                  onPressed: () {},
                                  icon: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: AppColor.appWhite),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(50))),
                                      child: const Icon(Icons.question_mark))),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: const [
                                CircleAvatar(
                                  backgroundImage: AssetImage(
                                      AppStrings.USER_PROFILE_PICTURE),
                                  maxRadius: 30,
                                  minRadius: 1,
                                ),
                              ],
                            ),
                          ),
                          Expanded(child: Column()),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(child: Column()),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "${userStore.userInfo.name} ${userStore.userInfo.surname}",
                                  style:
                                      const TextStyle(color: AppColor.appWhite),
                                ),
                                Text(
                                    "\$${(userStore.wallet.balance).toStringAsFixed(2)}",
                                    style: const TextStyle(
                                        color: AppColor.appWhite))
                              ],
                            ),
                          ),
                          Expanded(child: Column())
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const ProfileList(),
                Bounceable(
                  curve: Curves.decelerate,
                  scaleFactor: 0.6,
                  onTap: () async {
                    await prefs.setString("username", "");
                    await prefs.setString("password", "");
                    Get.offAllNamed(AppRoutes.LOGIN_SCREEN);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.logout_outlined,
                          color: AppColor.appBlue,
                        ),
                      ),
                      Text(
                        AppStrings.SIGN_OUT,
                        style: TextStyle(color: AppColor.appBlue),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

// CircleAvatar(
//                           backgroundImage:
//                               AssetImage(AppStrings.USER_PROFILE_PICTURE),
//                         ),
