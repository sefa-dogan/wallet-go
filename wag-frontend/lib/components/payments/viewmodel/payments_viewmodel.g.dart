// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payments_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PaymentsViewModel on _PaymentsViewModelBase, Store {
  late final _$currentTabIndexAtom =
      Atom(name: '_PaymentsViewModelBase.currentTabIndex', context: context);

  @override
  int get currentTabIndex {
    _$currentTabIndexAtom.reportRead();
    return super.currentTabIndex;
  }

  @override
  set currentTabIndex(int value) {
    _$currentTabIndexAtom.reportWrite(value, super.currentTabIndex, () {
      super.currentTabIndex = value;
    });
  }

  late final _$showAmountErrorMessageAtom = Atom(
      name: '_PaymentsViewModelBase.showAmountErrorMessage', context: context);

  @override
  bool get showAmountErrorMessage {
    _$showAmountErrorMessageAtom.reportRead();
    return super.showAmountErrorMessage;
  }

  @override
  set showAmountErrorMessage(bool value) {
    _$showAmountErrorMessageAtom
        .reportWrite(value, super.showAmountErrorMessage, () {
      super.showAmountErrorMessage = value;
    });
  }

  late final _$showDeleteTemplateBoxAtom = Atom(
      name: '_PaymentsViewModelBase.showDeleteTemplateBox', context: context);

  @override
  bool get showDeleteTemplateBox {
    _$showDeleteTemplateBoxAtom.reportRead();
    return super.showDeleteTemplateBox;
  }

  @override
  set showDeleteTemplateBox(bool value) {
    _$showDeleteTemplateBoxAtom.reportWrite(value, super.showDeleteTemplateBox,
        () {
      super.showDeleteTemplateBox = value;
    });
  }

  @override
  String toString() {
    return '''
currentTabIndex: ${currentTabIndex},
showAmountErrorMessage: ${showAmountErrorMessage},
showDeleteTemplateBox: ${showDeleteTemplateBox}
    ''';
  }
}
