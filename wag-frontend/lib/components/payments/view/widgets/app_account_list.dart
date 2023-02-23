import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_gesture_row.dart';
import 'package:flutter_boilerplate/components/payments/viewmodel/payments_viewmodel.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/locator.dart';
import 'package:flutter_boilerplate/store/user/viewmodel/user_store.dart';
import 'package:get/get.dart';

class AppAccountList extends StatelessWidget {
  AppAccountList({super.key});

  final userStore = locator<UserStore>();
  final viewmodel = locator<PaymentsViewModel>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.CHOOSE_CARD,
                style: const TextStyle(fontSize: AppIntValues.FIFTEEN),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: userStore.appAccounts.length,
            itemBuilder: (context, index) {
              return SFGestureRow(
                padding: const EdgeInsets.only(bottom: 10),
                title: userStore.appAccounts[index].name,
                onTap: () async {
                  viewmodel.selectedAppAccount = userStore.appAccounts[index];
                  await Get.showOverlay(
                      asyncFunction: () async {
                        await userStore
                            .getTransactions(userStore.appAccounts[index]);
                      },
                      loadingWidget: const Center(
                        child: CircularProgressIndicator(),
                      ),
                      opacity: 0.5,
                      opacityColor: AppColor.appGrey);

                  viewmodel.pageController!.animateToPage(
                      viewmodel.indexPageTransactionsList,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOut);
                },
              );
            },
          ),
        )
      ],
    );
  }
}
