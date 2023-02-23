// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';
import 'package:flutter_boilerplate/store/user/model/app_account.dart';
import 'package:flutter_boilerplate/store/user/model/transactions.dart';
import 'package:flutter_boilerplate/store/user/model/wallet.dart';

class SFListTile extends StatelessWidget {
  SFListTile(
      {super.key,
      required this.transactions,
      this.wallet,
      this.appAccount,
      this.leadingIcon,
      this.color,
      this.padding,
      this.onTap});

  Icon? leadingIcon;
  List<Transaction> transactions;
  Wallet? wallet;
  AppAccount? appAccount;
  EdgeInsets? padding;
  Color? color;
  DateTime? fromDate;
  DateTime? toDate;
  Function(Transaction, AppAccount)? onTap;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: padding,
      itemCount: transactions.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: AppIntValues.TEN),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(
                child: Icon(
              Icons.flash_on,
              color: AppColor.appAmber,
            )),
            Expanded(
              flex: 5,
              child: Card(
                shadowColor: AppColor.appTransparent,
                child: ListTile(
                  onTap: () async {
                    await onTap!(transactions[index], appAccount!);
                  },
                  tileColor: AppColor.appGrey,
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(AppIntValues.TEN))),
                  leading: leadingIcon,
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: Text(wallet!.name)),
                        Expanded(
                            child: transactions[index].fromAccountId ==
                                    appAccount!.id
                                ? Text(
                                    "-\$${transactions[index].amount}",
                                    style:
                                        const TextStyle(color: AppColor.appRed),
                                    textAlign: TextAlign.end,
                                  )
                                : transactions[index].fromAccountId ==
                                        AppStrings.ADMIN_APP_ACCOUNT_ID
                                    ? Text(
                                        "+\$${transactions[index].amount}*",
                                        style: const TextStyle(
                                            color: AppColor.appOrange),
                                        textAlign: TextAlign.end,
                                      )
                                    : Text(
                                        "+\$${transactions[index].amount}",
                                        style: const TextStyle(
                                            color: AppColor.appGreen),
                                        textAlign: TextAlign.end,
                                      ))
                      ],
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(appAccount!.name,
                              style:
                                  const TextStyle(color: AppColor.appTextGrey)),
                        ),
                        Expanded(
                            child: Text(
                          DateFormat.yMMMd().format(DateTime.parse(
                              transactions[index].transactionDate)),
                          style: const TextStyle(color: AppColor.appTextGrey),
                          textAlign: TextAlign.end,
                        )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/*
Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: AppColor.appGrey,
                            borderRadius: BorderRadius.all(
                                Radius.circular(AppIntValues.TEN))),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: AppIntValues.TEN,
                                    right: AppIntValues.TEN,
                                    top: AppIntValues.TEN),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Expanded(child: Text("Light")),
                                    Expanded(child: Text("\$28.10"))
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: AppIntValues.TEN,
                                    right: AppIntValues.TEN,
                                    bottom: AppIntValues.TEN),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Expanded(
                                      child: Text("MASTERCARD ****3241",
                                          style: TextStyle(
                                              color: AppColor.appTextGrey)),
                                    ),
                                    Expanded(
                                      child: Text("12/12/21",
                                          style: TextStyle(
                                              color: AppColor.appTextGrey)),
                                    )
                                  ],
                                ),
                              )
                            ]),
                      ),
*/