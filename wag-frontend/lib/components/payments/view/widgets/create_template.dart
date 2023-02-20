import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/payments/view/widgets/create_template_form.dart';
import 'package:flutter_boilerplate/components/payments/view/widgets/sf_drop_down_button_form_field.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_elevated_button.dart';
import 'package:flutter_boilerplate/components/payments/viewmodel/payments_viewmodel.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/locator.dart';
import 'package:flutter_boilerplate/store/user/viewmodel/user_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';

class CreateTemplate extends StatelessWidget {
  CreateTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Column()),
        Expanded(
          flex: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppStrings.RECTANGLE),
              Padding(
                padding: const EdgeInsets.only(
                    top: AppIntValues.THIRTY, bottom: AppIntValues.THIRTY),
                child: Text(
                  AppStrings.YOU_DONT_HAVE_TEMP,
                  style: const TextStyle(color: AppColor.appTextGrey),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: SFElevatedButton(
                      size: const Size(0, AppIntValues.FIFTY),
                      childEB: Text(AppStrings.CREATE_NEW),
                      onPressedEB: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return CreateTemplateForm();
                          },
                        );
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Expanded(child: Column())
      ],
    );
  }
}
