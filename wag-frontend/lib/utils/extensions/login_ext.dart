import 'package:flutter_boilerplate/components/login/view/login_screen.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_custom_alert.dart';

import 'package:flutter_boilerplate/components/login/viewmodel/login_viewmodel.dart';
import 'package:flutter_boilerplate/core/exceptions/invalid_password_exception.dart';
import 'package:flutter_boilerplate/core/exceptions/login_exception.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_elevated_button.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/core/exceptions/null_exception.dart';
import 'package:get/get.dart';

extension LoginExtension on LoginScreen {
  Future login(BuildContext context, LoginViewModel viewmodel) {
    return Get.showOverlay(
        asyncFunction: () async {
          try {
            await viewmodel
                .isUserRegistered()
                .timeout(const Duration(seconds: 10));
          } on TimeoutException catch (timeOutExp) {
            showDialog(
              context: context,
              builder: (context) => SFCustomAlert(
                  title: AppStrings.WARNING,
                  exception: timeOutExp,
                  message: AppStrings.CONNECTION_IS_LOW,
                  actions: [
                    SFElevatedButton(
                      childEB: Text(
                        AppStrings.OK,
                        style: const TextStyle(color: AppColor.appBlue),
                      ),
                      onPressedEB: () => Get.back(),
                      color: AppColor.appWhite,
                    )
                  ],
                  imagePath: AppStrings.EXCLAMATION_ICON),
            );
          } on NullException catch (nullExp) {
            showDialog(
              context: context,
              builder: (context) => SFCustomAlert(
                  title: AppStrings.WARNING,
                  exception: nullExp,
                  message: AppStrings.MISSING_INFORMATION,
                  actions: [
                    SFElevatedButton(
                      childEB: Text(
                        AppStrings.OK,
                        style: const TextStyle(color: AppColor.appBlue),
                      ),
                      onPressedEB: () => Get.back(),
                      color: AppColor.appWhite,
                    )
                  ],
                  imagePath: AppStrings.EXCLAMATION_ICON),
            );
          } on LoginException catch (loginExp) {
            showDialog(
              context: context,
              builder: (context) {
                return SFCustomAlert(
                    title: AppStrings.WE_ARE_SAD,
                    message: AppStrings.LOGIN_EXCEPTION,
                    exception: loginExp,
                    imagePath: AppStrings.SAD_FACE_IMG,
                    actions: [
                      SFElevatedButton(
                        childEB: Text(
                          AppStrings.TRY_AGAIN,
                          style: const TextStyle(color: AppColor.appBlue),
                        ),
                        onPressedEB: () => Get.back(),
                        color: AppColor.appWhite,
                      )
                    ]);
              },
            );
          } on InvalidPasswordException catch (invalidPasswordExp) {
            showDialog(
              context: context,
              builder: (context) {
                return SFCustomAlert(
                    title: AppStrings.WARNING,
                    message: AppStrings.INVALID_PASSWORD,
                    exception: invalidPasswordExp,
                    imagePath: AppStrings.EXCLAMATION_ICON,
                    actions: [
                      SFElevatedButton(
                        childEB: Text(
                          AppStrings.TRY_AGAIN,
                          style: const TextStyle(color: AppColor.appBlue),
                        ),
                        onPressedEB: () => Get.back(),
                        color: AppColor.appWhite,
                      )
                    ]);
              },
            );
          } catch (exp) {
            showDialog(
              context: context,
              builder: (context) {
                return SFCustomAlert(
                    title: AppStrings.WARNING,
                    message: AppStrings.ERROR_MESSAGE_SOMETHING_WENT_WRONG,
                    exception: Exception(),
                    imagePath: AppStrings.EXCLAMATION_ICON,
                    actions: [
                      SFElevatedButton(
                        childEB: Text(
                          AppStrings.TRY_AGAIN,
                          style: const TextStyle(color: AppColor.appBlue),
                        ),
                        onPressedEB: () => Get.back(),
                        color: AppColor.appWhite,
                      )
                    ]);
              },
            );
          }
        },
        opacityColor: AppColor.appOverlayColor,
        opacity: 0.5,
        loadingWidget: const Center(child: CircularProgressIndicator()));
  }
}
