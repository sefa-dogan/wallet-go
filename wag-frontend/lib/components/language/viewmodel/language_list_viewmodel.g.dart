// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_list_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LanguageListViewModel on _LanguageListViewModelBase, Store {
  late final _$selectedItemIndexAtom = Atom(
      name: '_LanguageListViewModelBase.selectedItemIndex', context: context);

  @override
  int get selectedItemIndex {
    _$selectedItemIndexAtom.reportRead();
    return super.selectedItemIndex;
  }

  @override
  set selectedItemIndex(int value) {
    _$selectedItemIndexAtom.reportWrite(value, super.selectedItemIndex, () {
      super.selectedItemIndex = value;
    });
  }

  late final _$_LanguageListViewModelBaseActionController =
      ActionController(name: '_LanguageListViewModelBase', context: context);

  @override
  dynamic getSelectedLanguageIndex() {
    final _$actionInfo =
        _$_LanguageListViewModelBaseActionController.startAction(
            name: '_LanguageListViewModelBase.getSelectedLanguageIndex');
    try {
      return super.getSelectedLanguageIndex();
    } finally {
      _$_LanguageListViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedItemIndex: ${selectedItemIndex}
    ''';
  }
}
