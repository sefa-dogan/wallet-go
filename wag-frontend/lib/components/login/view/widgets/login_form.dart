import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/login/viewmodel/login_viewmodel.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';
import 'package:flutter_boilerplate/core/route/app_routes.dart';
import 'package:flutter_boilerplate/locator.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_text_button.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_text_field.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});


  final viewmodel = locator<LoginViewModel>();
  final _padding = const EdgeInsets.all(AppIntValues.TEN);

  @override
  Widget build(BuildContext context) {
    List? arguments = Get.arguments;
    var argumentUsername = arguments != null ? arguments[0] : null;
    var argumentPassword = arguments != null ? arguments[1] : null;
    viewmodel.username = argumentUsername ?? "";
    viewmodel.password = argumentPassword ?? "";
    bool control = true;

//liste oluştur listenin içine username ve password ü kaydet ve buradan kullan
    return Padding(
      padding: _padding,
      child: Column(
        children: [
          Observer(builder: (_) {
            return SFTextField(
              errorText: viewmodel.showErrorMessageUsername &&
                      viewmodel.username.isEmpty
                  ? AppStrings.ERROR_MESSAGE_USERNAME
                  : null,
              keyboardType: TextInputType.text,
              controller: viewmodel.username.isNotEmpty && control
                  ? TextEditingController(text: viewmodel.username)
                  : null,
              title: AppStrings.USERNAME,
              hintText: AppStrings.ENTER_USERNAME,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppIntValues.TEN)),
              autofocus: false,
              onChanged: (value) => viewmodel.username = value,
              onTap: () {
                control = false;
                viewmodel.showErrorMessageUsername = true;
              },
            );
          }),
          Observer(builder: (_) {
            return SFTextField(
              errorText: viewmodel.showErrorMessagePassword &&
                      viewmodel.password.isEmpty
                  ? AppStrings.ERROR_MESSAGE_PASSWORD
                  : null,
              keyboardType: TextInputType.number,
              controller: viewmodel.password.isNotEmpty && control
                  ? TextEditingController(text: viewmodel.password)
                  : null,
              title: AppStrings.PASSWORD,
              hintText: AppStrings.ENTER_PASSWORD,
              obscureText: viewmodel.hidePassword,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppIntValues.TEN)),
              endIcon: IconButton(
                icon: viewmodel.hidePassword
                    ? const Icon(
                        Icons.visibility_off_outlined,
                        color: AppColor.questionCircleColor,
                      )
                    : const Icon(Icons.visibility_outlined,
                        color: AppColor.questionCircleColor),
                onPressed: () {
                  viewmodel.hidePassword = !viewmodel.hidePassword;
                },
              ),
              autofocus: false,
              onChanged: viewmodel.setPassword,
              onTap: () {
                control = false;
                viewmodel.showErrorMessagePassword = true;
              },
            );
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SFTextButton(
                buttonChild: const Text(
                  AppStrings.FORGOT_PASSWORD,
                  style: TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.underline),
                ),
                onPressedFunc: () =>
                    Get.toNamed(AppRoutes.FORGOT_PASSWORD_SCREEN),
              )
            ],
          )
        ],
      ),
    );
  }
}
