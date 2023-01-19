import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_elevated_button.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_text_field.dart';
import 'package:flutter_boilerplate/components/forgot_password/viewmoel/forgot_password_viewmodel.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/locator.dart';

class ForgotPasswordForm extends StatelessWidget {
  ForgotPasswordForm({super.key});
  final viewmodel = locator<ForgotPasswordViewModel>();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SFTextField(
          title: AppStrings.E_MAIL,
          hintText: AppStrings.ENTER_E_MAIL,
          autofocus: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppIntValues.TEN)),
          onChanged: (value) => viewmodel.email = value,
          keyboardType: TextInputType.emailAddress,
          onTap: () {},
        ),
        SFElevatedButton(
          childEB: const Text(AppStrings.CONTINUE),
          onPressedEB: () {},
        )
      ],
    );
  }
}
