import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/payments/view/widgets/sf_drop_down_button_form_field.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';

import 'package:flutter_boilerplate/core/constants/app_strings.dart';

class CategoryDropDown extends StatefulWidget {
  const CategoryDropDown({super.key});

  @override
  State<CategoryDropDown> createState() => _CategoryDropDownState();
}

class _CategoryDropDownState extends State<CategoryDropDown> {
  // ignore: prefer_typing_uninitialized_variables
  var dValue;
  @override
  Widget build(BuildContext context) {
    return SFDropdownButtonFormField(
        title: "Category",
        hint:  Text(
          AppStrings.CHOOSE_THE_CATEGORY,
          style: const TextStyle(color: AppColor.appPaleGrey),
        ),
        items: [
          {const Text("1. category"): 20},
          {const Text("2. category"): 30}
        ]);
  }
}
