import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate/components/language/viewmodel/language_list_viewmodel.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';
import 'package:flutter_boilerplate/locator.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

// ignore: must_be_immutable
class LanguageListItem extends StatelessWidget {
  LanguageListItem(
      {super.key, required this.language, required this.itemIndex});

  int itemIndex;
  String language;
  final _edgeInset = const EdgeInsets.all(AppIntValues.FIFTEEN);
  final viewmodel = locator<LanguageListViewModel>();
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return GestureDetector(
        onTap: () {
          viewmodel.selectedItemIndex = itemIndex;
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
              Text(language),
            ],
          ),
        ),
      );
    });
  }
}
