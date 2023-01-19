import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/success_payment/view/widgets/payment_details_form_item.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class PaymentDetailsForm extends StatelessWidget {
  const PaymentDetailsForm({super.key});
  @override
  Widget build(BuildContext context) {
    Map paymentDetails = Get.parameters;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          AppStrings.PAYMENT_DETAILS,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: AppIntValues.TWENTY),
        ),
        PaymentDetailsFormItem(
          title: AppStrings.CATEGORY,
          subtitle: "light",
        ),
        const Divider(),
        PaymentDetailsFormItem(
          title: AppStrings.SMART_CARD,
          subtitle: paymentDetails["appAccountName"],
        ),
        const Divider(),
        PaymentDetailsFormItem(
          title: AppStrings.PAYMENT_METHOD,
          subtitle: paymentDetails["walletName"],
        ),
        const Divider(),
        PaymentDetailsFormItem(
          title: AppStrings.AMOUNT,
          subtitle: paymentDetails["amount"],
        ),
        const Divider(),
        PaymentDetailsFormItem(
          title: AppStrings.PAYMENT_DATE,
          subtitle: paymentDetails["transactionDate"],
        ),
      ],
    );
  }
}
