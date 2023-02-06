import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_icon_button.dart';

import 'package:flutter_boilerplate/components/success_payment/view/widgets/payment_details_form.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/core/route/app_routes.dart';
import 'package:flutter_boilerplate/locator.dart';
import 'package:flutter_boilerplate/store/user/viewmodel/user_store.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SuccessPaymentScreen extends StatelessWidget {
  SuccessPaymentScreen({super.key});
  final userStore = locator<UserStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  color: AppColor.appBlue,
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(AppIntValues.TEN))),
              child: Row(children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: AppIntValues.TWENTY, left: AppIntValues.TWENTY),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SFIconButton(
                          iconColor: AppColor.appWhite,
                          iconIconButton: Icons.arrow_back_ios_new,
                          onPressedIconButton: () {},
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(AppStrings.SUCCESS_PAYMENT),
                       Text(
                        AppStrings.YOUR_PAYMENT_WAS_SUCCESSFUL,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColor.appWhite,
                            fontSize: AppIntValues.TWENTY),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: AppIntValues.TWENTY, right: AppIntValues.TWENTY),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: SFIconButton(
                                iconColor: AppColor.appWhite,
                                iconIconButton: Icons.close,
                                onPressedIconButton: () async {
                                  await userStore.getLastTransactions();
                                  Get.toNamed(AppRoutes.HOME_SCREEN);
                                }))
                      ],
                    ),
                  ),
                )
              ]),
            ),
          ),
          Expanded(
              flex: 2,
              child: ListView(children: const [
                Padding(
                  padding: EdgeInsets.all(AppIntValues.THIRTY),
                  child: PaymentDetailsForm(),
                )
              ]))
        ],
      ),
    );
  }
}
