// ignore_for_file: use_build_context_synchronously


import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_custom_alert.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_toast.dart';
import 'package:flutter_boilerplate/components/register/view/widgets/register_form.dart';
import 'package:flutter_boilerplate/components/register/viewmodel/register_viewmodel.dart';
import 'package:flutter_boilerplate/core/route/app_routes.dart';
import 'package:flutter_boilerplate/locator.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_elevated_button.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_text_button.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';
import 'package:flutter_boilerplate/core/constants/app_spaces.dart';
import 'package:flutter_boilerplate/toast.dart';
import 'package:flutter_boilerplate/utils/extensions/register_ext.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:tckn_check/tckn_check.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late Widget bottomSheett;

  final viewmodel = locator<RegisterViewModel>();
  @override
  Widget build(BuildContext context) {
    fToast.init(context);
    return Scaffold(
      backgroundColor: AppColor.appBlue,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                  flex: 1,
                  child: Center(
                      child: Text(
                    AppStrings.CREATE_ACCOUNT,
                    style: const TextStyle(color: Colors.white),
                  ))),
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
                          child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ListView(children: [RegisterForm()]),
                      )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(AppStrings.HAVE_ACCOUNT),
                          SFTextButton(
                            buttonChild: Text(
                              AppStrings.LOGIN,
                              style: const TextStyle(
                                  color: Colors.black,
                                  decoration: TextDecoration.underline),
                            ),
                            onPressedFunc: () =>
                                Get.toNamed(AppRoutes.LOGIN_SCREEN),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: AppSpaces.EB_SPACE,
                            right: AppSpaces.EB_SPACE,
                            bottom: AppSpaces.EB_SPACE),
                        child: Row(
                          children: [
                            Expanded(
                              child: SFElevatedButton(
                                childEB: Text(AppStrings.REGISTER),
                                onPressedEB: () async {
                                  if (Tckn().check(viewmodel.tcno) &&
                                      EmailValidator.validate(
                                          viewmodel.email)) {
                                    await const RegisterScreen()
                                        .register(context, viewmodel);

                                    !viewmodel.inProgress
                                        ? showDialog(
                                            context: context,
                                            builder: (context) => SFCustomAlert(
                                                title: AppStrings.SUCCESSFUL,
                                                message: "",
                                                actions: [
                                                  SFElevatedButton(
                                                    childEB:
                                                        Text(AppStrings.LOGIN),
                                                    onPressedEB: () =>
                                                        Get.offNamed(AppRoutes
                                                            .LOGIN_SCREEN),
                                                  )
                                                ],
                                                imagePath:
                                                    AppStrings.CHECK_ICON),
                                          )
                                        : null;
                                  } else {
                                    fToast.showToast(
                                      child: SFToast(
                                          message: AppStrings.VALIDATION_ERROR),
                                      gravity: ToastGravity.CENTER,
                                      toastDuration: const Duration(seconds: 2),
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
