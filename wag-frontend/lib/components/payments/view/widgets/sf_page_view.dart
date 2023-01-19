import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/payments/view/widgets/transaction_list.dart';
import 'package:flutter_boilerplate/components/payments/view/widgets/app_account_list.dart';
import 'package:flutter_boilerplate/components/payments/viewmodel/payments_viewmodel.dart';
import 'package:flutter_boilerplate/locator.dart';

class SFPageView extends StatelessWidget {
  SFPageView({super.key});

  final viewmodel = locator<PaymentsViewModel>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     const Text(
        //       AppStrings.CHOOSE_PAYMENT_METHOD,
        //       style: TextStyle(fontSize: AppIntValues.FIFTEEN),
        //     ),
        //     IconButton(
        //       icon: const Icon(Icons.filter_list),
        //       onPressed: () => Get.toNamed(AppRoutes.FILTERS_SCREEN),
        //     )
        //   ],
        // ),
        Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
          controller: viewmodel.controller,
          children: [AppAccountList(), TransactionsList()],
        )),
      ],
    );
  }
}
