// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_custom_alert.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_elevated_button.dart';
import 'package:flutter_boilerplate/components/language/viewmodel/language_list_viewmodel.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/core/constants/shared_preferences.dart';
import 'package:flutter_boilerplate/locator.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class LanguageListItem extends StatelessWidget {
  LanguageListItem(
      {super.key, required this.language, required this.itemIndex});

  int itemIndex;
  List<String> language;
  final _edgeInset = const EdgeInsets.all(AppIntValues.FIFTEEN);
  final viewmodel = locator<LanguageListViewModel>();
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return GestureDetector(
        onTap: () async {
          viewmodel.selectedItemIndex = itemIndex;
          await SharedPref.prefs.setStringList("appLanguage", [language[1],language[2]]);
          showDialog(
            context: context,
            builder: (context) => SFCustomAlert(
              title: AppStrings.WARNING,
                message:
                    AppStrings.LANGUAGE_CHANGE,
                actions: [
                  SFElevatedButton(
                    childEB: Text(AppStrings.OK),
                    onPressedEB: () => Get.back(),
                  )
                ],
                imagePath: AppStrings.EXCLAMATION_ICON),
          );
        },
        child: Container(
          padding: _edgeInset,
          margin: _edgeInset,
          decoration: BoxDecoration(
            color: AppColor.appGrey,
            border: viewmodel.selectedItemIndex == itemIndex
                ? Border.all(color: AppColor.appBlue)
                : null,
            borderRadius:
                const BorderRadius.all(Radius.circular(AppIntValues.TEN)),
          ),
          child: Row(
            children: [
              Text(language[0]),
            ],
          ),
        ),
      );
    });
  }
}
