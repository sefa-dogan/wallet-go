import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

import 'package:flutter_boilerplate/components/atomic_widgets/sf_text_button.dart';
import 'package:flutter_boilerplate/components/home/viewmodel/home_viewmodel.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/core/route/app_routes.dart';
import 'package:flutter_boilerplate/locator.dart';
import 'package:flutter_boilerplate/store/user/viewmodel/user_store.dart';

class LatestPaymentsList extends StatelessWidget {
  LatestPaymentsList({super.key});
  final userStore = locator<UserStore>();
  final viewmodel = locator<HomeViewModel>();
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          pinned: false,
          snap: false,
          floating: false,
          backgroundColor: AppColor.appWhite,
          expandedHeight: 100,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            titlePadding: const EdgeInsets.only(
                left: AppIntValues.TWENTY, right: AppIntValues.TWENTY),
            title: Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text(
                    AppStrings.LATEST_PAYMENTS,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: AppColor.appTitleBlack,
                    ),
                  ),
                  SFTextButton(
                    buttonChild:  Text(
                      AppStrings.ALL,
                      style: const TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                        color: AppColor.appTitleBlack,
                        decoration: TextDecoration.underline,
                      ),
                      textAlign: TextAlign.end,
                    ),
                    onPressedFunc: () => Get.toNamed(AppRoutes.PAYMENTS_SCREEN),
                  )
                ],
              ),
            ),
          ),
        ),
        SliverList(
          delegate: userStore.lastTransactions.isEmpty
              ? SliverChildBuilderDelegate((context, index) {
                  return Center(child: Text(AppStrings.HAVE_NO_EXPENSE));
                }, childCount: 1)
              : SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    viewmodel.matchTransactionsAndAppAccounts(
                        userStore.lastTransactions[index]);
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: AppIntValues.TEN, right: AppIntValues.TEN),
                      child: Card(
                        shadowColor: AppColor.appTransparent,
                        child: Row(
                          children: [
                            const Expanded(
                              flex: 1,
                              child: Icon(
                                Icons.flash_on_rounded,
                                color: AppColor.appAmber,
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: ListTile(
                                tileColor: AppColor.appGrey,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(AppIntValues.TEN))),
                                title: Padding(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                          child: Text(userStore.wallet.name)),
                                      Expanded(
                                          child: Text(
                                        "-\$${userStore.lastTransactions[index].amount}",
                                        style: const TextStyle(
                                            color: AppColor.appRed),
                                        textAlign: TextAlign.end,
                                      ))
                                    ],
                                  ),
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                            viewmodel.currentAppAccount.name,
                                            style: const TextStyle(
                                                color: AppColor.appTextGrey)),
                                      ),
                                      Expanded(
                                        child: Text(
                                          DateFormat.yMMMd().format(
                                            DateTime.parse(
                                              userStore.lastTransactions[index]
                                                  .transactionDate,
                                            ),
                                          ),
                                          style: const TextStyle(
                                              color: AppColor.appTextGrey),
                                          textAlign: TextAlign.end,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  childCount: userStore.lastTransactions.length,
                ),
        ),
      ],
    );
  }
}
