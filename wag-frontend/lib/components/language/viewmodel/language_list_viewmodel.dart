import 'package:mobx/mobx.dart';
part 'language_list_viewmodel.g.dart';

// ignore: library_private_types_in_public_api
class LanguageListViewModel = _LanguageListViewModelBase
    with _$LanguageListViewModel;

abstract class _LanguageListViewModelBase with Store {
  @observable
  int selectedItemIndex = 0;
}
