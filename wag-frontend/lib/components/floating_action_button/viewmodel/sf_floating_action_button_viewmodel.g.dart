// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sf_floating_action_button_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SFFloatingActionButtonViewModel
    on _SFFloatingActionButtonViewModelBase, Store {
  late final _$indexAtom = Atom(
      name: '_SFFloatingActionButtonViewModelBase.index', context: context);

  @override
  int get index {
    _$indexAtom.reportRead();
    return super.index;
  }

  @override
  set index(int value) {
    _$indexAtom.reportWrite(value, super.index, () {
      super.index = value;
    });
  }

  late final _$templateIndexAtom = Atom(
      name: '_SFFloatingActionButtonViewModelBase.templateIndex',
      context: context);

  @override
  int? get templateIndex {
    _$templateIndexAtom.reportRead();
    return super.templateIndex;
  }

  @override
  set templateIndex(int? value) {
    _$templateIndexAtom.reportWrite(value, super.templateIndex, () {
      super.templateIndex = value;
    });
  }

  @override
  String toString() {
    return '''
index: ${index},
templateIndex: ${templateIndex}
    ''';
  }
}
