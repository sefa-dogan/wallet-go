import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/payments/view/widgets/filter_label.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';

import 'package:flutter_boilerplate/components/atomic_widgets/sf_list_tile.dart';
import 'package:flutter_boilerplate/components/payments/viewmodel/create_pdf_viewmodel.dart';
import 'package:flutter_boilerplate/components/payments/viewmodel/payments_viewmodel.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/core/route/app_routes.dart';
import 'package:flutter_boilerplate/locator.dart';
import 'package:flutter_boilerplate/store/user/viewmodel/user_store.dart';
import 'package:intl/intl.dart';

class TransactionsList extends StatelessWidget {
  TransactionsList({super.key});
  final userStore = locator<UserStore>();
  final viewmodel = locator<PaymentsViewModel>();
  final createPdfViewModel = locator<CreatePdfViewModel>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(AppStrings.TRANSACTIONS),
            IconButton(
              icon: const Icon(Icons.filter_list),
              onPressed: () {
                Get.toNamed(AppRoutes.FILTERS_SCREEN);
              },
            )
          ],
        ),
        Observer(builder: (_) {
          return Visibility(
              visible: viewmodel.fromDate != null && viewmodel.toDate != null
                  ? true
                  : false,
              child: FilterLabel());
        }),
        Expanded(
            child: viewmodel.selectedAppAccount != null
                ? Observer(
                    builder: (context) {
                      return SFListTile(
                          onTap: createPdfViewModel.createPDF,
                          wallet: userStore.wallet,
                          appAccount: viewmodel.selectedAppAccount!,
                          transactions: userStore.transactions.reversed
                              .where((transaction) =>
                                  viewmodel.fromDate != null &&
                                          viewmodel.toDate != null
                                      ? DateTime.parse(
                                              transaction.transactionDate) ==
                                          viewmodel.toDate
                                      : true)
                              .toList());
                    },
                  )
                : SizedBox())
      ],
    );
  }
}
