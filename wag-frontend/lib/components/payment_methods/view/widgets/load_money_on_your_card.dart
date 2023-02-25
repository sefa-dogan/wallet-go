// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';

import 'package:flutter_boilerplate/components/atomic_widgets/sf_custom_alert.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_elevated_button.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_text_field.dart';
import 'package:flutter_boilerplate/components/payment_methods/viewmodel/payment_methods_viewmodel.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/locator.dart';
import 'package:flutter_boilerplate/store/user/viewmodel/user_store.dart';

class LoadMoneyOnYourCard extends StatelessWidget {
  LoadMoneyOnYourCard({super.key});
  final userStore = locator<UserStore>();
  final viewmodel = locator<PaymentMethodsViewModel>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SFTextField(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          title: "Amount of money to be loaded",
          autofocus: true,
          onChanged: (value) {
            value.isNotEmpty && !value.contains("-")&&!value.contains(",")&&!value.startsWith(".")
                ? viewmodel.moneyToLoad = double.parse(value)
                : viewmodel.moneyToLoad = 0;
          },
          keyboardType: TextInputType.number,
          onTap: () {},
        ),
        Observer(builder: (_) {
          return SFElevatedButton(
              childEB: const Text("Load"),
              onPressedEB: viewmodel.moneyToLoad > 0
                  ? () async {
                      await Get.showOverlay(
                          asyncFunction: () async {
                            await viewmodel.loadMoney();
                          },
                          loadingWidget: const Center(
                            child: CircularProgressIndicator(),
                          ),
                          opacity: 0.5,
                          opacityColor: AppColor.appOverlayColor);

                      viewmodel.isCompleted
                          ? showDialog(
                              context: context,
                              builder: (context) {
                                viewmodel.isCompleted = false;
                                return SFCustomAlert(
                                  title: AppStrings.SUCCESSFUL,
                                    message: "Başarıyla para yüklendi",
                                    actions: [
                                      SFElevatedButton(
                                        childEB:  Text(AppStrings.OK),
                                        onPressedEB: () => Get.back(),
                                      )
                                    ],
                                    imagePath: AppStrings.CHECK_ICON);
                              },
                            )
                          : null;
                    }
                  : null);
        })
      ],
    );
  }
}
