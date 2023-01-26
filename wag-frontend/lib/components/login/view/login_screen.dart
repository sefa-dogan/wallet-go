import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_custom_alert.dart';

import 'package:flutter_boilerplate/components/login/view/widgets/login_form.dart';
import 'package:flutter_boilerplate/components/login/viewmodel/login_viewmodel.dart';
import 'package:flutter_boilerplate/core/exceptions/invalid_password_exception.dart';
import 'package:flutter_boilerplate/core/exceptions/login_exception.dart';
import 'package:flutter_boilerplate/core/route/app_routes.dart';
import 'package:flutter_boilerplate/locator.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_elevated_button.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_text_button.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';
import 'package:flutter_boilerplate/core/exceptions/null_exception.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final viewmodel = locator<LoginViewModel>();
  @override
  Widget build(BuildContext context) {

    return Stack(children: [
      Scaffold(
        backgroundColor: AppColor.appBlue,
        body: Column(
          children: [
            const Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  AppStrings.LOGIN,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(AppIntValues.TEN),
                        topRight: Radius.circular(AppIntValues.TEN))),
                child: Column(
                  children: [
                    Expanded(
                        child: ListView(children: [
                      LoginForm(
                      
                      )
                    ])),
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: AppIntValues.TWENTY),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(AppStrings.HAVE_NOT_ACCOUNT),
                              SFTextButton(
                                buttonChild: const Text(
                                  AppStrings.REGISTER,
                                  style: TextStyle(
                                      color: Colors.black,
                                      decoration: TextDecoration.underline),
                                ),
                                onPressedFunc: () =>
                                    Get.toNamed(AppRoutes.REGISTER_SCREEN),
                              )
                            ],
                          ),
                          SFElevatedButton(
                              childEB: const Text(AppStrings.LOGIN),
                              onPressedEB: () async {
                                Get.showOverlay(
                                    asyncFunction: () async {
                                      try {
                                        await viewmodel
                                            .isUserRegistered()
                                            .timeout(
                                                const Duration(seconds: 10));
                                      } on TimeoutException catch (timeOutExp) {
                                        showDialog(
                                          context: context,
                                          builder: (context) => SFCustomAlert(
                                              exception: timeOutExp,
                                              message:
                                                  AppStrings.CONNECTION_IS_LOW,
                                              actions: [
                                                SFElevatedButton(
                                                  childEB: const Text(
                                                    AppStrings.OK,
                                                    style: TextStyle(
                                                        color:
                                                            AppColor.appBlue),
                                                  ),
                                                  onPressedEB: () => Get.back(),
                                                  color: AppColor.appWhite,
                                                )
                                              ],
                                              imagePath:
                                                  AppStrings.EXCLAMATION_ICON),
                                        );
                                      } on NullException catch (nullExp) {
                                        showDialog(
                                          context: context,
                                          builder: (context) => SFCustomAlert(
                                              exception: nullExp,
                                              message: AppStrings
                                                  .MISSING_INFORMATION,
                                              actions: [
                                                SFElevatedButton(
                                                  childEB: const Text(
                                                    AppStrings.OK,
                                                    style: TextStyle(
                                                        color:
                                                            AppColor.appBlue),
                                                  ),
                                                  onPressedEB: () => Get.back(),
                                                  color: AppColor.appWhite,
                                                )
                                              ],
                                              imagePath:
                                                  AppStrings.EXCLAMATION_ICON),
                                        );
                                      } on LoginException catch (loginExp) {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return SFCustomAlert(
                                                message:
                                                    AppStrings.LOGIN_EXCEPTION,
                                                exception: loginExp,
                                                imagePath: AppStrings.SAD_FACE,
                                                actions: [
                                                  SFElevatedButton(
                                                    childEB: const Text(
                                                      AppStrings.TRY_AGAIN,
                                                      style: TextStyle(
                                                          color:
                                                              AppColor.appBlue),
                                                    ),
                                                    onPressedEB: () =>
                                                        Get.back(),
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
                                                message:
                                                    AppStrings.INVALID_PASSWORD,
                                                exception: invalidPasswordExp,
                                                imagePath: AppStrings.SAD_FACE,
                                                actions: [
                                                  SFElevatedButton(
                                                    childEB: const Text(
                                                      AppStrings.TRY_AGAIN,
                                                      style: TextStyle(
                                                          color:
                                                              AppColor.appBlue),
                                                    ),
                                                    onPressedEB: () =>
                                                        Get.back(),
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
                                                message: AppStrings
                                                    .ERROR_MESSAGE_SOMETHING_WENT_WRONG,
                                                exception: Exception(),
                                                imagePath: AppStrings.SAD_FACE,
                                                actions: [
                                                  SFElevatedButton(
                                                    childEB: const Text(
                                                      AppStrings.TRY_AGAIN,
                                                      style: TextStyle(
                                                          color:
                                                              AppColor.appBlue),
                                                    ),
                                                    onPressedEB: () =>
                                                        Get.back(),
                                                    color: AppColor.appWhite,
                                                  )
                                                ]);
                                          },
                                        );
                                      }
                                    },
                                    opacityColor: AppColor.appOverlayColor,
                                    opacity: 0.5,
                                    loadingWidget: const Center(
                                        child: CircularProgressIndicator()));
                              })
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      // Center(
      //   child: Observer(builder: (_) {
      //     debugPrint("tetiklendi");
      //     return viewmodel.isLogingIn
      //         ? const CircularProgressIndicator()
      //         : const SizedBox();
      //   }),
      // ),
    ]);
  }
}
