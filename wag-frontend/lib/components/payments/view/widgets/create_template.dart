import 'package:flutter/material.dart';

import 'package:flutter_boilerplate/components/atomic_widgets/sf_elevated_button.dart';
import 'package:flutter_boilerplate/components/payments/view/widgets/create_template_form.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';

class CreateTemplate extends StatelessWidget {
  const CreateTemplate({super.key});

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
