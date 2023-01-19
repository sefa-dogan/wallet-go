import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_app_bar.dart';
import 'package:flutter_boilerplate/components/language/view/widgets/language_list_item.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';

// ignore: must_be_immutable
class LanguageListScreen extends StatelessWidget {
  LanguageListScreen({super.key});

  List<String> languages = ["Turkish", "English", "Spanish"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SFAppBar().appBar(AppStrings.LANGUAGE),
        backgroundColor: AppColor.appWhite,
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: languages.length,
                itemBuilder: (context, index) {
                  return LanguageListItem(
                    language: languages[index],
                    itemIndex: index,
                  );
                },
              ),
            ),
          ],
        ));
  }
}
