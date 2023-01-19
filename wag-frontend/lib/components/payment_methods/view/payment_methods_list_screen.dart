import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_app_bar.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_icon_button.dart';
import 'package:flutter_boilerplate/components/payment_methods/view/widgets/payment_method_and_my_smart_cards.dart';
import 'package:flutter_boilerplate/components/payment_methods/viewmodel/payment_methods_viewmodel.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/locator.dart';

class PaymentMethodsListScreen extends StatelessWidget {
  PaymentMethodsListScreen({super.key});
  final viewmodel = locator<PaymentMethodsViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appWhite,
      appBar: SFAppBar().appBar(
        AppStrings.PAYMENT_METHODS,
        actions: [
          SFIconButton(
              iconIconButton: Icons.edit,
              iconColor: AppColor.appBlack,
              onPressedIconButton: viewmodel.isPressedEdit)
        ],
      ),
      body: PaymentMethodAndMySmartCards(),
    );
  }
}
