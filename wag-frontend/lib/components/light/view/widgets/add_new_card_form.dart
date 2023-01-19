import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_elevated_button.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_text.dart';
import 'package:flutter_boilerplate/components/light/view/widgets/sf_local_text_field.dart';
import 'package:flutter_boilerplate/components/light/viewmodel/light_viewmodel.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/core/route/app_routes.dart';
import 'package:flutter_boilerplate/locator.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class AddNewCardForm extends StatelessWidget {
  AddNewCardForm({super.key});

  final radius = AppIntValues.TEN;
  bool? valueC = false;
  final viewmodel = locator<LightViewModel>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppIntValues.TWENTY),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () => viewmodel.controller.animateToPage(
                          viewmodel.pageIndexChooseSmartCardList,
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeIn),
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        size: AppIntValues.TWENTY,
                      )),
                  SFText(text: AppStrings.ADD_NEW_CARD)
                ],
              ),
              IconButton(
                  onPressed: () => Get.back(), icon: const Icon(Icons.close))
            ],
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: AppIntValues.TWENTY),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Column(
                            //16 digits number column
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: AppIntValues.TEN),
                                child: Row(
                                  children: const [
                                    Text(AppStrings.DIGITS_NUMBER),
                                  ],
                                ),
                              ),
                              SFLocalTextField(
                                readOnly: false,
                                hintText: AppStrings.CARD_NUMBER_SAMPLE,
                                hintTextColor: AppColor.appPaleGrey,
                                suffixIcon: IconButton(
                                    onPressed: () =>
                                        Get.toNamed(AppRoutes.SCAN_CARD_SCREEN),
                                    icon: const Icon(
                                      Icons.credit_card,
                                      color: AppColor.appBlack,
                                    )),
                                borderColor: AppColor.appPaleGrey,
                                borderRadius: radius,
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: AppIntValues.TWENTY,
                                bottom: AppIntValues.TWENTY),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  //Expiration date column
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          bottom: AppIntValues.TEN),
                                      child: Text(AppStrings.EXPIRATION_DATE),
                                    ),
                                    SFLocalTextField(
                                      readOnly: false,
                                      borderColor: AppColor.appPaleGrey,
                                      borderRadius: AppIntValues.TEN,
                                      hintText: AppStrings.MM_YY,
                                      hintTextColor: AppColor.appPaleGrey,
                                      constraints: BoxConstraints.expand(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              AppIntValues.ZEROPOINTFORTYTHREE,
                                          height: AppIntValues.FIFTY),
                                    )
                                  ],
                                ),
                                Column(
                                  //CVV / CVC column
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          bottom: AppIntValues.TEN),
                                      child: Text(AppStrings.CVV_CVC),
                                    ),
                                    SFLocalTextField(
                                      readOnly: false,
                                      hintText: AppStrings.STAR,
                                      hintTextColor: AppColor.appPaleGrey,
                                      borderColor: AppColor.appPaleGrey,
                                      borderRadius: radius,
                                      suffixIcon: IconButton(
                                        icon: Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(),
                                            ),
                                            child: const Icon(
                                              Icons.question_mark,
                                              color: AppColor.appBlack,
                                            )),
                                        onPressed: () => viewmodel.controller
                                            .animateToPage(
                                                viewmodel
                                                    .pageIndexWhatIsCvvCvcCode,
                                                duration:
                                                    const Duration(seconds: 1),
                                                curve: Curves.easeInOut),
                                      ),
                                      constraints: BoxConstraints.expand(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              AppIntValues.ZEROPOINTFORTYTHREE,
                                          height: AppIntValues.FIFTY),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Observer(builder: (_) {
                                return Checkbox(
                                  value: viewmodel.stateCheckBox,
                                  onChanged: (value) {
                                    viewmodel.stateCheckBox = value;
                                  },
                                );
                              }),
                              const Text(AppStrings.SAVE_THIS_PAYMENT_METHOD)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SFElevatedButton(
                          size: Size(MediaQuery.of(context).size.width,
                              AppIntValues.FIFTY),
                          childEB: const Text(AppStrings.ADD),
                          onPressedEB: () {},
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/* class AddNewPaymentMethodForm {
  final radius = AppIntValues.TEN;
  bool? valueC = false;
  final viewmodel = locator<LightViewModel>();

  getPageViewModel(BuildContext context) {
    return PageViewModel(
        titleWidget: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      size: AppIntValues.TWENTY,
                    )),
                SFText(text: AppStrings.ADD_NEW_PAYMENT_METHOD)
              ],
            ),
            IconButton(
                onPressed: () => Get.back(), icon: const Icon(Icons.close))
          ],
        ),
        bodyWidget: Column(
          children: [
            Column(
              //16 digits number column
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: AppIntValues.TEN),
                  child: Row(
                    children: const [
                      Text(AppStrings.DIGITS_NUMBER),
                    ],
                  ),
                ),
                SFLocalTextField(
                  readOnly: false,
                  hintText: AppStrings.CARD_NUMBER_SAMPLE,
                  hintTextColor: AppColor.appPaleGrey,
                  suffixIcon: IconButton(
                      onPressed: () => Get.toNamed(AppRoutes.SCAN_CARD_SCREEN),
                      icon: const Icon(
                        Icons.credit_card,
                        color: AppColor.appBlack,
                      )),
                  borderColor: AppColor.appPaleGrey,
                  borderRadius: radius,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: AppIntValues.TWENTY, bottom: AppIntValues.TWENTY),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    //Expiration date column
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: AppIntValues.TEN),
                        child: Text(AppStrings.EXPIRATION_DATE),
                      ),
                      SFLocalTextField(
                        readOnly: false,
                        borderColor: AppColor.appPaleGrey,
                        borderRadius: AppIntValues.TEN,
                        hintText: AppStrings.MM_YY,
                        hintTextColor: AppColor.appPaleGrey,
                        constraints: BoxConstraints.expand(
                            width: MediaQuery.of(context).size.width *
                                AppIntValues.ZEROPOINTFORTYTHREE,
                            height: AppIntValues.FIFTY),
                      )
                    ],
                  ),
                  Column(
                    //CVV / CVC column
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: AppIntValues.TEN),
                        child: Text(AppStrings.CVV_CVC),
                      ),
                      SFLocalTextField(
                        readOnly: false,
                        hintText: AppStrings.STAR,
                        hintTextColor: AppColor.appPaleGrey,
                        borderColor: AppColor.appPaleGrey,
                        borderRadius: radius,
                        suffixIcon: IconButton(
                          icon: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(),
                              ),
                              child: const Icon(
                                Icons.question_mark,
                                color: AppColor.appBlack,
                              )),
                          onPressed: () => showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return const WhatIsCvvCvcCode();
                            },
                          ),
                        ),
                        constraints: BoxConstraints.expand(
                            width: MediaQuery.of(context).size.width *
                                AppIntValues.ZEROPOINTFORTYTHREE,
                            height: AppIntValues.FIFTY),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Observer(builder: (_) {
                  return Checkbox(
                    value: viewmodel.stateCheckBox,
                    onChanged: (value) {
                      viewmodel.stateCheckBox = value;
                    },
                  );
                }),
                const Text(AppStrings.SAVE_THIS_PAYMENT_METHOD)
              ],
            ),
          ],
        ),
        footer: Row(
          children: [
            Expanded(
              child: SFElevatedButton(
                size:
                    Size(MediaQuery.of(context).size.width, AppIntValues.FIFTY),
                childEB: const Text(AppStrings.ADD),
                onPressedEB: () {},
              ),
            ),
          ],
        ));
  }
}
 */