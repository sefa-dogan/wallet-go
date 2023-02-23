import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/payments/viewmodel/payments_viewmodel.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/core/route/app_routes.dart';
import 'package:flutter_boilerplate/locator.dart';
import 'package:flutter_boilerplate/store/user/model/app_account.dart';
import 'package:flutter_boilerplate/store/user/viewmodel/user_store.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class TemplateList extends StatelessWidget {
  TemplateList({super.key});

  final userStore = locator<UserStore>();
  final viewmodel = locator<PaymentsViewModel>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              AppStrings.TEMPLATES,
              style: const TextStyle(fontSize: AppIntValues.FIFTEEN),
            ),
          ],
        ),
        Expanded(
            child: ListView.builder(
          itemBuilder: (context, index) {
            AppAccount currentAccount = userStore.appAccounts.firstWhere(
                (account) =>
                    account.id == userStore.templates[index].accountId);
            return Container(
              width: double.infinity,
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  color: AppColor.appGrey,
                  borderRadius:
                      BorderRadius.all(Radius.circular(AppIntValues.TEN))),
              child: Row(
                children: [
                  Expanded(
                    child: Card(
                      shadowColor: AppColor.appTransparent,
                      color: AppColor.appGrey,
                      child: ListTile(
                        onTap: () {
                          Get.toNamed(AppRoutes.LIGHT_SCREEN,
                              arguments: [index, true]);
                        },
                        leading: const Icon(
                          Icons.flash_on,
                          color: AppColor.appAmber,
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(currentAccount.name),
                            Text("\$${userStore.templates[index].amount}")
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          itemCount: userStore.templates.length,
        )),
      ],
    );
  }
}
