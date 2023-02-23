import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_app_bar.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_elevated_button.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_snack_bar.dart';
import 'package:flutter_boilerplate/components/filters/view/widgets/choose_date.dart';
import 'package:flutter_boilerplate/components/filters/viewmodel/filters_viewmodel.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/core/route/app_routes.dart';
import 'package:flutter_boilerplate/locator.dart';
import 'package:get/get.dart';

class FiltersScreen extends StatelessWidget {
  FiltersScreen({super.key});
  final viewmodel = locator<FiltersViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SFAppBar().appBar(AppStrings.FILTERS),
      body: Padding(
        padding: const EdgeInsets.all(AppIntValues.TEN),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: const [
                // CategoryDropDown(),
                ChooseDate(),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: SFElevatedButton(
                    size: const Size(0, AppIntValues.FIFTY),
                    childEB: Text(AppStrings.APPLY),
                    onPressedEB: () {
                      viewmodel.fromDate != null && viewmodel.toDate != null
                          ? Get.offNamed(AppRoutes.PAYMENTS_SCREEN,
                              arguments: <DateTime?>[
                                  viewmodel.fromDate,
                                  viewmodel.toDate
                                ])
                          : SFSnackBar().showSnackBar(AppStrings.WARNING,
                              AppStrings.SELECT_BOTH_FROM_AND_TO_DATE);
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
