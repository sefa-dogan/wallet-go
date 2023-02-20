import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_custom_alert.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_snack_bar.dart';
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

import '../../../store/user/model/template.dart';

class LightScreen extends StatelessWidget {
  LightScreen({super.key});
  final viewmodel = locator<LightViewModel>();
  final userStore = locator<UserStore>();
  @override
  Widget build(BuildContext context) {
    debugPrint(Get.previousRoute);
    Get.arguments != null
        ? viewmodel.setTemplate(Get.arguments)
        : null; // payments ekranında template e tıklanıldığı zaman template index i gönderilir ve bu satırda bu index bilgisi alınır.
    return Stack(children: [
      WillPopScope(
        onWillPop: () {
          viewmodel.setAsDefaultValues();
          Get.back();
          return Future.value();
        },
        child: Scaffold(
          backgroundColor: AppColor.appWhite,
          appBar: SFAppBar().appBar(
            AppStrings.LIGHT,
            actions: Get.arguments != null && viewmodel.comingForEditTemplate
                ? [
                    SFTextButton(
                      buttonChild: Text(
                        AppStrings.DELETE_TEMPLATE,
                        style: const TextStyle(
                            color: AppColor.appRed,
                            decoration: TextDecoration.underline),
                      ),
                      onPressedFunc: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return SFCustomAlert(
                              title: AppStrings.WARNING,
                              message: AppStrings.LIGHT_ALERT_DIALOG_CONTENT,
                              actions: [
                                SFElevatedButton(
                                    childEB: Text(AppStrings.YES_I_AM_SURE),
                                    onPressedEB: () async {
                                      try {
                                        await Get.showOverlay(
                                            asyncFunction: () async {
                                              await viewmodel
                                                  .deleteTemplate(viewmodel
                                                      .currentTemplate!.id)
                                                  .then((value) =>
                                                      SFSnackBar().showSnackBar(
                                                        AppStrings.SUCCESSFUL,
                                                        "Template is deleted",
                                                      ));
                                            },
                                            loadingWidget: const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                            opacity: 0.7,
                                            opacityColor:
                                                AppColor.appOverlayColor);
                                        Get.offAllNamed(
                                            AppRoutes.PAYMENTS_SCREEN);
                                      } catch (e) {
                                        SFAlertDialog().showAlertDialog(
                                          context,
                                          buttonText: AppStrings.OK,
                                          content: AppStrings
                                              .ERROR_MESSAGE_SOMETHING_WENT_WRONG,
                                          icon: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                  AppStrings.EXCLAMATION_ICON)
                                            ],
                                          ),
                                        );
                                      }
                                    })
                              ],
                              imagePath: AppStrings.EXCLAMATION_ICON,
                            );
                          },
                        );

                        // SFAlertDialog().showAlertDialog(context,
                        //     buttonText: AppStrings.YES_I_AM_SURE,
                        //     content: AppStrings.LIGHT_ALERT_DIALOG_CONTENT,
                        //     title: AppStrings.WARNING,
                        //     icon: Row(
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       children: [
                        //         Image.asset(AppStrings.EXCLAMATION_ICON)
                        //       ],
                        //     ));
                      },
                    )
                  ]
                : null,
            onPressedLeading: () {
              viewmodel.setAsDefaultValues();
              Get.back();
            },
          ),
          body: Column(
            children: [
              Expanded(
                flex: 3,
                child: ListView(
                  children: [
                    PaymentMethod(),
                    SmartCard(),
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
                          childEB: Get.arguments != null &&
                                  viewmodel.comingForEditTemplate
                              ? Text(AppStrings.APPLY)
                              : Text(AppStrings.PAY),
                          onPressedEB: Get.arguments != null &&
                                  viewmodel.comingForEditTemplate
                              ? () async {
                                  await Get.showOverlay(
                                      asyncFunction: () async {
                                        await viewmodel
                                            .updateTemplate(
                                                viewmodel.currentTemplate!.id)
                                            .then((value) =>
                                                SFSnackBar().showSnackBar(
                                                  AppStrings.SUCCESSFUL,
                                                  "Template is updated",
                                                ));
                                      },
                                      loadingWidget: Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                      opacity: 0.7,
                                      opacityColor: AppColor.appOverlayColor);
                                }
                              : () async {
                                  await Get.showOverlay(
                                      asyncFunction: () async {
                                        try {
                                          await viewmodel.startTransfer();
                                        } on NullException catch (nullExp) {
                                          showDialog(
                                            context: context,
                                            builder: (context) => SFCustomAlert(
                                                title: AppStrings.WARNING,
                                                exception: nullExp,
                                                message: AppStrings.EMPTY_FIELD,
                                                actions: [
                                                  SFElevatedButton(
                                                    childEB:
                                                        Text(AppStrings.OK),
                                                    onPressedEB: () =>
                                                        Get.back(),
                                                  )
                                                ],
                                                imagePath: AppStrings
                                                    .EXCLAMATION_ICON),
                                          );
                                        } on BalanceException catch (balanceExp) {
                                          showDialog(
                                            context: context,
                                            builder: (context) => SFCustomAlert(
                                                title: AppStrings.WE_ARE_SAD,
                                                exception: balanceExp,
                                                message: AppStrings
                                                    .INSUFFICIENT_BALANCE,
                                                actions: [
                                                  SFElevatedButton(
                                                    childEB:
                                                        Text(AppStrings.OK),
                                                    onPressedEB: () =>
                                                        Get.back(),
                                                  )
                                                ],
                                                imagePath: AppStrings
                                                    .EXCLAMATION_ICON),
                                          );
                                        } on InvalidIbanException catch (invalidIbanExp) {
                                          showDialog(
                                            context: context,
                                            builder: (context) => SFCustomAlert(
                                                title: AppStrings.WARNING,
                                                exception: invalidIbanExp,
                                                message:
                                                    AppStrings.INVALID_IBAN,
                                                actions: [
                                                  SFElevatedButton(
                                                    childEB:
                                                        Text(AppStrings.OK),
                                                    onPressedEB: () =>
                                                        Get.back(),
                                                  )
                                                ],
                                                imagePath: AppStrings
                                                    .EXCLAMATION_ICON),
                                          );
                                        } catch (exp) {
                                          showDialog(
                                            context: context,
                                            builder: (context) => SFCustomAlert(
                                                title: AppStrings.WARNING,
                                                exception: Exception(),
                                                message: AppStrings
                                                    .ERROR_MESSAGE_SOMETHING_WENT_WRONG,
                                                actions: [
                                                  SFElevatedButton(
                                                    childEB:
                                                        Text(AppStrings.OK),
                                                    onPressedEB: () =>
                                                        Get.back(),
                                                  )
                                                ],
                                                imagePath: AppStrings
                                                    .EXCLAMATION_ICON),
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
      ),
    ]);
  }
}
