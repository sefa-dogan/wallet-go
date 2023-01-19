import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_text_field.dart';
import 'package:flutter_boilerplate/components/light/viewmodel/light_viewmodel.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/locator.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Iban extends StatelessWidget {
  Iban({super.key});

  final viewmodel = locator<LightViewModel>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Observer(builder: (_) {
          return SFTextField(
            readOnly: false,
            autofocus: false,
            errorText: viewmodel.showIbanErrorText && viewmodel.iban.isEmpty
                ? AppStrings.ERROR_MESSAGE_IBAN
                : null,
            title: AppStrings.IBAN,
            hintText: AppStrings.ENTER_IBAN,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppIntValues.TEN),
                borderSide: const BorderSide(color: AppColor.appTextGrey)),
            onChanged: (value) {
              viewmodel.iban = value;
            },
            keyboardType: TextInputType.text,
            onTap: () => viewmodel.showIbanErrorText = true,
          );
        })
      ],
    );
  }
}
