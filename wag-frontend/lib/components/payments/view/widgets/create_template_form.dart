import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_elevated_button.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_snack_bar.dart';
import 'package:flutter_boilerplate/components/payments/view/widgets/sf_drop_down_button_form_field.dart';
import 'package:flutter_boilerplate/components/payments/viewmodel/payments_viewmodel.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/locator.dart';
import 'package:flutter_boilerplate/store/user/viewmodel/user_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';

class CreateTemplateForm extends StatelessWidget {
  CreateTemplateForm({super.key});
  final userStore = locator<UserStore>();
  final viewmodel = locator<PaymentsViewModel>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SFDropdownButtonFormField(
                  title: AppStrings.CHOOSE_CARD,
                  items: userStore.appAccounts
                      .map((account) => {Text(account.name): account})
                      .toList(),
                  hint: Text(AppStrings.CHOOSE_CARD)),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  width: Get.mediaQuery.size.width / 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(AppStrings.AMOUNT),
                      ),
                      Observer(builder: (_) {
                        return TextField(
                          decoration: InputDecoration(
                              errorMaxLines: 2,
                              errorText: viewmodel.showAmountErrorMessage &&
                                      viewmodel.amountForTemplate == 0
                                  ? AppStrings.INVALID_AMOUNT
                                  : null,
                              hintText: AppStrings.AMOUNT,
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(AppIntValues.TEN))),
                          autofocus: false,
                          onChanged: (value) {
                            try {
                              viewmodel.amountForTemplate =
                                  double.tryParse(value)!;
                              if (viewmodel.amountForTemplate < 0) {
                                throw Exception();
                              } else {
                                viewmodel.showAmountErrorMessage = false;
                              }
                            } catch (e) {
                              viewmodel.showAmountErrorMessage = true;
                              viewmodel.amountForTemplate = 0;
                              debugPrint("double türünde sayı giriniz.");
                            }
                          },
                          keyboardType: TextInputType.number,
                          onTap: () {
                            viewmodel.showAmountErrorMessage = true;
                          },
                        );
                      }),
                    ],
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SFElevatedButton(
                size: Size(Get.mediaQuery.size.width / 4, 50),
                childEB: Text(AppStrings.CREATE_NEW),
                onPressedEB: () async {
                  if (viewmodel.amountForTemplate != 0 &&
                      viewmodel.selectedAppAccountForTemplate != null) {
                    await Get.showOverlay(
                        asyncFunction: () async {
                          await viewmodel.postTemplate();
                        },
                        loadingWidget: const Center(
                          child: CircularProgressIndicator(),
                        ),
                        opacityColor: AppColor.appOverlayColor,
                        opacity: 0.7);
                    Get.back();
                    SFSnackBar().showSnackBar(AppStrings.SUCCESSFUL, "");
                  } else {
                    Get.snackbar(AppStrings.WARNING, AppStrings.EMPTY_FIELD,
                        snackPosition: SnackPosition.BOTTOM,
                        barBlur: 1,
                        colorText: AppColor.appWhite,
                        backgroundColor: AppColor.appBlue,
                        animationDuration: Duration(milliseconds: 500),
                        duration: Duration(seconds: 2));
                  }
                },
              )
            ],
          )
        ],
      ),
    );
    ;
  }
}
