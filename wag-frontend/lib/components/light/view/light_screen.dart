import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_custom_alert.dart';
import 'package:flutter_boilerplate/components/light/model/success_payment.dart';
import 'package:flutter_boilerplate/core/exceptions/balance_exception.dart';
import 'package:flutter_boilerplate/core/exceptions/invalid_iban_exception.dart';
import 'package:flutter_boilerplate/core/exceptions/null_exception.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

import 'package:flutter_boilerplate/components/atomic_widgets/sf_alert_dialog.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_app_bar.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_elevated_button.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_text_button.dart';
import 'package:flutter_boilerplate/components/light/view/widgets/amount.dart';
import 'package:flutter_boilerplate/components/light/view/widgets/iban.dart';
import 'package:flutter_boilerplate/components/light/view/widgets/payment_method.dart';
import 'package:flutter_boilerplate/components/light/view/widgets/smart_card.dart';
import 'package:flutter_boilerplate/components/light/viewmodel/light_viewmodel.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/core/route/app_routes.dart';
import 'package:flutter_boilerplate/locator.dart';
import 'package:flutter_boilerplate/store/user/viewmodel/user_store.dart';

class LightScreen extends StatelessWidget {
  LightScreen({super.key});
  final viewmodel = locator<LightViewModel>();
  final userStore = locator<UserStore>();
  @override
  Widget build(BuildContext context) {
    debugPrint(Get.previousRoute);
    return Stack(children: [
      Scaffold(
        backgroundColor: AppColor.appWhite,
        appBar: SFAppBar().appBar(AppStrings.LIGHT,
            actions: Get.previousRoute == AppRoutes.PAYMENTS_SCREEN
                ? [
                    SFTextButton(
                      buttonChild: const Text(
                        AppStrings.DELETE_TEMPLATE,
                        style: TextStyle(
                            color: AppColor.appRed,
                            decoration: TextDecoration.underline),
                      ),
                      onPressedFunc: () {
                        SFAlertDialog().showAlertDialog(context,
                            buttonText: AppStrings.YES_I_AM_SURE,
                            content: AppStrings.LIGHT_ALERT_DIALOG_CONTENT,
                            title: AppStrings.WARNING,
                            icon: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(AppStrings.EXCLAMATION_ICON)
                              ],
                            ));
                      },
                    )
                  ]
                : null),
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: ListView(
                children: [
                  PaymentMethod(),
                  SmartCard(
                    smartCardTemplateList: const [],
                  ),
                  const AmountDropDown(),
                  Iban(),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(AppIntValues.TEN),
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Expanded(
                      child: SFElevatedButton(
                        size: const Size(0, AppIntValues.FIFTY),
                        childEB: Get.previousRoute == AppRoutes.PAYMENTS_SCREEN
                            ? const Text(AppStrings.APPLY)
                            : const Text(AppStrings.PAY),
                        onPressedEB: Get.previousRoute ==
                                AppRoutes.PAYMENTS_SCREEN
                            ? () {}
                            : () async {
                                await Get.showOverlay(
                                    asyncFunction: () async {
                                      try {
                                        await viewmodel.startTransfer();
                                      } on NullException catch (nullExp) {
                                        showDialog(
                                          context: context,
                                          builder: (context) => SFCustomAlert(
                                              exception: nullExp,
                                              message: AppStrings.EMPTY_FIELD,
                                              actions: [
                                                SFElevatedButton(
                                                  childEB:
                                                      const Text(AppStrings.OK),
                                                  onPressedEB: () => Get.back(),
                                                )
                                              ],
                                              imagePath:
                                                  AppStrings.EXCLAMATION_ICON),
                                        );
                                      } on BalanceException catch (balanceExp) {
                                        showDialog(
                                          context: context,
                                          builder: (context) => SFCustomAlert(
                                              exception: balanceExp,
                                              message: AppStrings
                                                  .INSUFFICIENT_BALANCE,
                                              actions: [
                                                SFElevatedButton(
                                                  childEB:
                                                      const Text(AppStrings.OK),
                                                  onPressedEB: () => Get.back(),
                                                )
                                              ],
                                              imagePath:
                                                  AppStrings.EXCLAMATION_ICON),
                                        );
                                      } on InvalidIbanException catch (invalidIbanExp) {
                                        showDialog(
                                          context: context,
                                          builder: (context) => SFCustomAlert(
                                              exception: invalidIbanExp,
                                              message: AppStrings.INVALID_IBAN,
                                              actions: [
                                                SFElevatedButton(
                                                  childEB:
                                                      const Text(AppStrings.OK),
                                                  onPressedEB: () => Get.back(),
                                                )
                                              ],
                                              imagePath:
                                                  AppStrings.EXCLAMATION_ICON),
                                        );
                                      } catch (exp) {
                                        showDialog(
                                          context: context,
                                          builder: (context) => SFCustomAlert(
                                              exception: Exception(),
                                              message: AppStrings
                                                  .ERROR_MESSAGE_SOMETHING_WENT_WRONG,
                                              actions: [
                                                SFElevatedButton(
                                                  childEB:
                                                      const Text(AppStrings.OK),
                                                  onPressedEB: () => Get.back(),
                                                )
                                              ],
                                              imagePath:
                                                  AppStrings.EXCLAMATION_ICON),
                                        );
                                      }
                                    },
                                    loadingWidget: const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                    opacity: 0.5,
                                    opacityColor: AppColor.appOverlayColor);

                                viewmodel.isCompleted
                                    ? Get.toNamed(
                                        AppRoutes.SUCCESS_PAYMENT_SCREEN,
                                        parameters: SuccessPayment(
                                                appAccountName: viewmodel
                                                    .selectedAppAccount!.name,
                                                walletName:
                                                    userStore.wallet.name,
                                                amount: viewmodel.amount!,
                                                transactionDate: DateFormat(
                                                        "yyyy-MM-dd hh:mm:ss")
                                                    .format(DateTime.now()))
                                            .toMap(),
                                      )
                                    : null;
                                viewmodel.isCompleted = false;
                              },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      // Observer(builder: (_) {
      //   return Center(
      //     child:
      //         viewmodel.inProgress ? const CircularProgressIndicator() : null,
      //   );
      // })
    ]);
  }
}
