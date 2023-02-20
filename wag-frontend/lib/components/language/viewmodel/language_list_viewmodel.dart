import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/core/constants/shared_preferences.dart';
import 'package:mobx/mobx.dart';
part 'language_list_viewmodel.g.dart';

// ignore: library_private_types_in_public_api
class LanguageListViewModel = _LanguageListViewModelBase
    with _$LanguageListViewModel;

abstract class _LanguageListViewModelBase with Store {
  List<List<String>> languages = [
    [AppStrings.TURKISH, "tr", "TR"],
    [AppStrings.ENGLISH, "en", "US"]
  ];

  @observable
  int selectedItemIndex = 0;
  @action
  getSelectedLanguageIndex() {
    List<String?>? selectedLanguage =
        SharedPref.prefs.getStringList("appLanguage");
    if (selectedLanguage != null) {
      for (var language in languages) {
        selectedItemIndex = language.contains(selectedLanguage[0])
            ? languages.indexOf(language)
            : 0;
      }
    }
  }
}
