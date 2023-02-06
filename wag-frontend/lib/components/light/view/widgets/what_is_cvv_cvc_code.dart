import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_text.dart';
import 'package:flutter_boilerplate/components/light/viewmodel/light_viewmodel.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/locator.dart';
import 'package:get/get.dart';

class WhatIsCvvCvcCode extends StatelessWidget {
  WhatIsCvvCvcCode({super.key});
  final viewmodel = locator<LightViewModel>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: AppIntValues.TWENTY,
          left: AppIntValues.TWENTY,
          right: AppIntValues.TWENTY),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () => viewmodel.controller.previousPage(duration: const Duration(seconds: 1), curve: Curves.easeInOut),
                    icon: const Icon(Icons.arrow_back_ios_new)),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: AppIntValues.TEN),
                    child: SFText(text: AppStrings.WHAT_IS_CVV_CODE),
                  ),
                ),
                IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(
                      Icons.close,
                      color: AppColor.appPaleGrey,
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: AppIntValues.FOURTY, bottom: AppIntValues.FOURTY),
              child: Image.asset(
                AppStrings.CARD_CVV,
              ),
            ),
             Padding(
              padding: const EdgeInsets.only(bottom: AppIntValues.TWENTY),
              child: Text(AppStrings.CVV_CODE_IS),
            )
          ],
        ),
      ),
    );
  }
}
