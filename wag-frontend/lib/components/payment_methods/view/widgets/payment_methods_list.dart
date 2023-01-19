import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_elevated_button.dart';
import 'package:flutter_boilerplate/components/payment_methods/view/widgets/add_new_payment_button.dart';
import 'package:flutter_boilerplate/components/payment_methods/view/widgets/delete_button.dart';
import 'package:flutter_boilerplate/components/payment_methods/viewmodel/payment_methods_viewmodel.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/locator.dart';
import 'package:flutter_boilerplate/store/user/viewmodel/user_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

// ignore: must_be_immutable
class PaymentMethodsList extends StatelessWidget {
  PaymentMethodsList({
    super.key,
  });
  final viewmodel = locator<PaymentMethodsViewModel>();
  final userStore = locator<UserStore>();

  // String id;
  @override
  Widget build(BuildContext context) {
    var padding = const EdgeInsets.all(AppIntValues.FIFTEEN);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Expanded(
              child: Observer(builder: (_) {
                return GestureDetector(
                  onTap: () => viewmodel.controller.animateToPage(1,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOut),
                  /*  onTap: viewmodel.selected
                      ? null
                      : () {
                          // debugPrint(id);
                        }, */
                  child: Container(
                      padding: padding,
                      margin: padding,
                      decoration: BoxDecoration(
                          color: AppColor.appGrey,
                          border: Border.all(color: AppColor.appTransparent),
                          borderRadius: const BorderRadius.all(
                              Radius.circular(AppIntValues.FIFTEEN))),
                      child: Row(
                        children: [
                          Text(userStore.wallet.name),
                        ],
                      )),
                );
              }),
            ),
            DeleteButton()
          ],
        ),
        Column(
          children: [
            const AddNewPaymentButton(),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(AppIntValues.TEN),
                    child: SFElevatedButton(
                      size: const Size(0, AppIntValues.FIFTY),
                      childEB: const Text(AppStrings.APPLY),
                      onPressedEB: () {},
                    ),
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
