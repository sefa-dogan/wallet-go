import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_alert_dialog.dart';
import 'package:flutter_boilerplate/components/payment_methods/viewmodel/payment_methods_viewmodel.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/locator.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class DeleteButton extends StatelessWidget {
  DeleteButton({super.key});
  final viewmodel = locator<PaymentMethodsViewModel>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        debugPrint("çöpkutusuna basıldı");
        SFAlertDialog().showAlertDialog(context,
            buttonText: AppStrings.YES_DELETE,
            content: AppStrings.PAYMENT_METHODS_DELETE_BUTTON_CONTENT,
            title: AppStrings.WARNING,
            icon: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppStrings.EXCLAMATION_ICON,
                  fit: BoxFit.scaleDown,
                ),
              ],
            ));
      },
      child: Observer(builder: (_) {
        return AnimatedContainer(
            duration: const Duration(seconds: 1),
            width: viewmodel.selected ? 50 : 0,
            color: AppColor.appWhite,
            curve: Curves.fastLinearToSlowEaseIn,
            child: const Icon(
              Icons.delete,
              color: AppColor.appRed,
            ));
      }),
    );
  }
}
