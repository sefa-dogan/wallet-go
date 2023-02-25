import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/payments/view/widgets/transaction_list.dart';
import 'package:flutter_boilerplate/components/payments/view/widgets/app_account_list.dart';
import 'package:flutter_boilerplate/components/payments/viewmodel/payments_viewmodel.dart';
import 'package:flutter_boilerplate/locator.dart';

class SFPageView extends StatefulWidget {
  const SFPageView({super.key});

  @override
  State<SFPageView> createState() => _SFPageViewState();
}

class _SFPageViewState extends State<SFPageView> {
  final viewmodel = locator<PaymentsViewModel>();

  @override
  Widget build(BuildContext context) {
    viewmodel.pageController =
        PageController(initialPage: viewmodel.currentPageIndex);
    return Column(
      children: [
        Expanded(
            child: PageView(
          physics: viewmodel.selectedAppAccount == null
              ? const NeverScrollableScrollPhysics()
              : const AlwaysScrollableScrollPhysics(),
          controller: viewmodel.pageController,
          children: [AppAccountList(), TransactionsList()],
          onPageChanged: (value) {
            viewmodel.currentPageIndex = value;
            viewmodel.currentPageIndex == 0
                ? viewmodel.selectedAppAccount = null
                : null;
            setState(() {});
          },
        )),
      ],
    );
  }
}
