import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_list_tile.dart';
import 'package:flutter_boilerplate/components/payments/view/widgets/create_template.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/store/user/model/transactions.dart';

// ignore: must_be_immutable
class TemplateList extends StatelessWidget {
  TemplateList({super.key});

  List<Transaction> lisT = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children:  [
            Text(
              AppStrings.TEMPLATES,
              style: const TextStyle(fontSize: AppIntValues.FIFTEEN),
            ),
          ],
        ),
        Expanded(
            child: lisT.isNotEmpty
                ? SFListTile(
                    transactions: lisT,
                    // cardColor: AppColor.appGrey,
                  )
                : const CreateTemplate()),
      ],
    );
  }
}
