// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_text_field.dart';
import 'package:flutter_boilerplate/components/light/view/widgets/choose_currency_list.dart';
import 'package:flutter_boilerplate/components/light/viewmodel/light_viewmodel.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/locator.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class AmountDropDown extends StatefulWidget {
  const AmountDropDown({super.key});

  @override
  State<AmountDropDown> createState() => _AmountDropDownState();
}

class _AmountDropDownState extends State<AmountDropDown> {
  // ignore: prefer_typing_uninitialized_variables
  final viewmodel = locator<LightViewModel>();
  // var valuee;
  double radius = AppIntValues.TEN;

  @override
  Widget build(BuildContext context) {
    bool isOnTapped = false;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              flex: 4,
              child: Padding(
                  padding: const EdgeInsets.only(right: AppIntValues.TEN),
                  child: Observer(builder: (_) {
                    return SFTextField(
                      errorText: viewmodel.showAmountErrorText &&
                              (viewmodel.amount == null ||
                                  viewmodel.amount == "")
                          ? AppStrings.ERROR_MESSAGE_AMOUNT
                          : null,
                      title: AppStrings.AMOUNT,
                      autofocus: false,
                      readOnly: false,
                      controller:
                          viewmodel.currentTemplate != null && !isOnTapped
                              ? TextEditingController(
                                  text: viewmodel.amount.toString())
                              : null,
                      border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: AppColor.appTextGrey),
                          borderRadius: BorderRadius.circular(radius)),
                      hintText: AppStrings.ENTER_PAYMENT_AMOUNT,
                      onChanged: (value) {
                        try {
                          viewmodel.amount =
                              value != "" ? double.parse(value) : null;
                        } catch (e) {
                          viewmodel.amount = null;
                        }
                      },
                      onTap: () {
                        viewmodel.showAmountErrorText = true;
                        isOnTapped = true;
                      },
                      keyboardType: TextInputType.number,
                    );
                  })),
            ),
            Expanded(
                flex: 2,
                child: Observer(builder: (_) {
                  return SFTextField(
                    errorText: viewmodel.showCurrencyErrorText &&
                            viewmodel.selectedCurrency == null
                        ? AppStrings.ERROR_MESSAGE_CURRENCY
                        : null,
                    autofocus: false,
                    readOnly: true,
                    controller:
                        TextEditingController(text: viewmodel.selectedCurrency),
                    hintText: AppStrings.CURRENCY,
                    endIcon: const Icon(Icons.keyboard_arrow_down),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: AppColor.appTextGrey),
                      borderRadius: BorderRadius.circular(radius),
                    ),
                    onTap: () {
                      viewmodel.showCurrencyErrorText = true;
                      return showModalBottomSheet(
                        context: context,
                        builder: (context) => ChooseCurrencyList(),
                      );
                    },
                    onChanged: (p0) {},
                    keyboardType: TextInputType.text,
                  );
                })),
          ],
        ),
      ],
    );
  }
}
