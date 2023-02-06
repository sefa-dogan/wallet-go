import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/locator.dart';
import 'package:flutter_boilerplate/store/user/viewmodel/user_store.dart';

class UserInfoBar extends StatelessWidget {
  UserInfoBar({super.key});

  final userStore = locator<UserStore>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: AppIntValues.TWENTY),
      child: Row(
        children: [
           CircleAvatar(
            radius: AppIntValues.FOURTY,
            backgroundImage: AssetImage(AppStrings.USER_PROFILE_PICTURE),
          ),
          Padding(
            padding: const EdgeInsets.only(left: AppIntValues.TWENTY),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${userStore.userInfo.name} ${userStore.userInfo.surname}",
                  style: const TextStyle(color: AppColor.appWhite),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: AppIntValues.TWENTY),
                  child: Text(
                    "\$${(userStore.wallet.balance).toStringAsFixed(2)}",
                    style: const TextStyle(color: AppColor.appWhite),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
