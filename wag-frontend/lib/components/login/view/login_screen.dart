
import 'package:flutter/material.dart';

import 'package:flutter_boilerplate/components/login/view/widgets/login_form.dart';
import 'package:flutter_boilerplate/components/login/viewmodel/login_viewmodel.dart';
import 'package:flutter_boilerplate/core/route/app_routes.dart';
import 'package:flutter_boilerplate/locator.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_elevated_button.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_text_button.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';
import 'package:flutter_boilerplate/utils/extensions/login_ext.dart';
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
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  AppStrings.LOGIN,
                  style: const TextStyle(color: Colors.white),
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
                    Expanded(child: ListView(children: [LoginForm()])),
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: AppIntValues.TWENTY),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(AppStrings.HAVE_NOT_ACCOUNT),
                              SFTextButton(
                                buttonChild: Text(
                                  AppStrings.REGISTER,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      decoration: TextDecoration.underline),
                                ),
                                onPressedFunc: () =>
                                    Get.toNamed(AppRoutes.REGISTER_SCREEN),
                              )
                            ],
                          ),
                          SFElevatedButton(
                              childEB: Text(AppStrings.LOGIN),
                              onPressedEB: () async {
                                await LoginScreen().login(context, viewmodel);
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
    ]);
  }
}
