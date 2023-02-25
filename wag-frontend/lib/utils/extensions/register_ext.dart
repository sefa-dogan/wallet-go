import 'package:flutter_boilerplate/components/register/view/register_screen.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_custom_alert.dart';
import 'package:flutter_boilerplate/components/register/viewmodel/register_viewmodel.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_elevated_button.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/core/exceptions/null_exception.dart';
import 'package:get/get.dart';

extension RegisterExtension on RegisterScreen {
  Future register(BuildContext context, RegisterViewModel viewmodel) {
    return Get.showOverlay(
        asyncFunction: () async {
          try {
            await viewmodel.postAppUser().timeout(const Duration(seconds: 10));
          } on TimeoutException catch (timeOutExp) {
            showDialog(
              context: context,
              builder: (context) {
                return SFCustomAlert(
                  title: AppStrings.WARNING,
                  message: AppStrings.CONNECTION_IS_LOW,
                  exception: timeOutExp,
                  imagePath: AppStrings.EXCLAMATION_ICON,
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
                );
              },
            );
          } on NullException catch (exp) {
            viewmodel.changeStateAllErrorText();
            showDialog(
              context: context,
              builder: (context) => SFCustomAlert(
                  title: AppStrings.WARNING,
                  imagePath: AppStrings.EXCLAMATION_ICON,
                  exception: exp,
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
                  ]),
            );
          } catch (genericExp) {
            showDialog(
              context: context,
              builder: (context) {
                return SFCustomAlert(
                    title: AppStrings.WE_ARE_SAD,
                    message: AppStrings.REGISTER_FAILED,
                    exception: Exception(),
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
          }
        },
        loadingWidget: const Center(
          child: CircularProgressIndicator(),
        ),
        opacity: 0.5,
        opacityColor: AppColor.appOverlayColor);
  }
}
