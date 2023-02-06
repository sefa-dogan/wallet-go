import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_app_bar.dart';
import 'package:flutter_boilerplate/components/language/view/widgets/language_list_item.dart';
import 'package:flutter_boilerplate/components/language/viewmodel/language_list_viewmodel.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/locator.dart';

// ignore: must_be_immutable
class LanguageListScreen extends StatelessWidget {
  LanguageListScreen({super.key});

  final viewmodel = locator<LanguageListViewModel>();

  @override
  Widget build(BuildContext context) {
    viewmodel.getSelectedLanguageIndex();
    return Scaffold(
        appBar: SFAppBar().appBar(AppStrings.LANGUAGE),
        backgroundColor: AppColor.appWhite,
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: viewmodel.languages.length,
                itemBuilder: (context, index) {
                  return LanguageListItem(
                    language: viewmodel.languages[index],
                    itemIndex: index,
                  );
                },
              ),
            ),
          ],
        ));
  }
}
