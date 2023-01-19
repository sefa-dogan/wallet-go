import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_list_tile.dart';
import 'package:flutter_boilerplate/components/payments/viewmodel/create_pdf_viewmodel.dart';
import 'package:flutter_boilerplate/components/payments/viewmodel/payments_viewmodel.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/locator.dart';
import 'package:flutter_boilerplate/store/user/viewmodel/user_store.dart';

class TransactionsList extends StatelessWidget {
  TransactionsList({super.key});
  final userStore = locator<UserStore>();
  final viewmodel = locator<PaymentsViewModel>();
  final createPdfViewModel = locator<CreatePdfViewModel>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(AppIntValues.TEN),
          child: Row(
            children: const [
              Text(AppStrings.TRANSACTIONS),
            ],
          ),
        ),
        Expanded(
            child: SFListTile(
                onTap: createPdfViewModel.createPDF,
                wallet: userStore.wallet,
                appAccount: viewmodel.selectedAppAccount!,
                transactions: userStore.transactions.reversed.toList()))
      ],
    );
  }
}
