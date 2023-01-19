// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_elevated_button.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_gesture_row.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_icon_button.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_text.dart';
import 'package:flutter_boilerplate/components/light/viewmodel/light_viewmodel.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/locator.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';

class ChooseCurrencyList extends StatelessWidget {
  ChooseCurrencyList({super.key});

  final viewmodel = locator<LightViewModel>();
  List currencyList = ["TL", "USD", "EUR"];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppIntValues.TWENTY),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            SFText(text: AppStrings.CHOOSE_CURRENCY),
            SFIconButton(
              iconIconButton: Icons.close,
              onPressedIconButton: () => Get.back(),
              iconColor: AppColor.appPaleGrey,
            )
          ]),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: AppIntValues.TWENTY),
                  height: MediaQuery.of(context).size.height / 4,
                  child: ListView.builder(
                    itemCount: currencyList.length,
                    itemBuilder: (context, index) {
                      return Observer(builder: (_) {
                        return SFGestureRow(
                            borderColor: viewmodel.indexCurrency == index
                                ? AppColor.appBlue
                                : AppColor.appTransparent,
                            trailingWidget: const SizedBox(),
                            title: currencyList[index],
                            onTap: () {
                              viewmodel.indexCurrency = index;
                            },
                            padding: const EdgeInsets.only(
                                bottom: AppIntValues.TEN));
                      });
                    },
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Observer(builder: (_) {
                        return SFElevatedButton(
                          size:
                              const Size(AppIntValues.ZERO, AppIntValues.FIFTY),
                          childEB: const Text(AppStrings.CONTINUE),
                          onPressedEB: viewmodel.indexCurrency != null
                              ? () {
                                  viewmodel.selectedCurrency =
                                      currencyList[viewmodel.indexCurrency!];

                                  Get.back();
                                }
                              : null,
                        );
                      }),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
