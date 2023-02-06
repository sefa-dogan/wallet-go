import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_elevated_button.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_icon_button.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_text_field.dart';
import 'package:flutter_boilerplate/components/payment_methods/view/widgets/load_money_on_your_card.dart';
import 'package:flutter_boilerplate/components/payment_methods/viewmodel/payment_methods_viewmodel.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/locator.dart';
import 'package:flutter_boilerplate/store/user/viewmodel/user_store.dart';
import 'package:get/get.dart';

class EditMySmartCard extends StatelessWidget {
  EditMySmartCard({super.key});
  final userStore = locator<UserStore>();
  final viewmodel = locator<PaymentMethodsViewModel>();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SFIconButton(
                  iconIconButton: Icons.share,
                  onPressedIconButton: () => showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Row(
                          children: [
                             Text("${AppStrings.IBAN}: "),
                            Expanded(
                              child: TextField(
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder()),
                                controller: TextEditingController(
                                    text: viewmodel.selectedAppAccount.id),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
            SFTextField(
              title: "Your card name",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              hintText: "Enter your card name",
              controller: viewmodel.newAppAccountName.isEmpty
                  ? TextEditingController(
                      text: viewmodel.selectedAppAccount.name)
                  : null,
              autofocus: false,
              onChanged: (value) => viewmodel.newAppAccountName = value,
              keyboardType: TextInputType.text,
              onTap: () {},
            ),
          ],
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: SFElevatedButton(
                size: Size(MediaQuery.of(context).size.width, 50),
                borderColor: AppColor.appBlue,
                color: AppColor.appWhite,
                childEB: const Text(
                  "Load money on card",
                  style: TextStyle(color: AppColor.appBlue),
                ),
                onPressedEB: () => showModalBottomSheet(
                  context: context,
                  builder: (context) => LoadMoneyOnYourCard(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SFElevatedButton(
                  size: Size(MediaQuery.of(context).size.width, 50),
                  childEB:  Text(AppStrings.APPLY),
                  onPressedEB: () async {
                    Get.showOverlay(
                        asyncFunction: () async {
                          await viewmodel.setAppAccountName();
                        },
                        loadingWidget: const Center(
                          child: CircularProgressIndicator(),
                        ),
                        opacityColor: AppColor.appOverlayColor,
                        opacity: 0.5);
                  }),
            ),
          ],
        )
      ],
    );
  }
}
