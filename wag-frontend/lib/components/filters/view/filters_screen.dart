import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_app_bar.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_elevated_button.dart';
import 'package:flutter_boilerplate/components/filters/view/widgets/category_dropdown.dart';
import 'package:flutter_boilerplate/components/filters/view/widgets/date.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  // ignore: prefer_typing_uninitialized_variables
  var valuee;
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
                CategoryDropDown(),
                Date(),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: SFElevatedButton(
                    size: const Size(0, AppIntValues.FIFTY),
                    childEB: const Text(AppStrings.APPLY),
                    onPressedEB: () {},
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
