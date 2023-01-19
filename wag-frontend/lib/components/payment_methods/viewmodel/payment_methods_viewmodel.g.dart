// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_methods_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PaymentMethodsViewModel on _PaymentMethodsViewModelBase, Store {
  late final _$selectedAtom =
      Atom(name: '_PaymentMethodsViewModelBase.selected', context: context);

  @override
  bool get selected {
    _$selectedAtom.reportRead();
    return super.selected;
  }

  @override
  set selected(bool value) {
    _$selectedAtom.reportWrite(value, super.selected, () {
      super.selected = value;
    });
  }

  late final _$moneyToLoadAtom =
      Atom(name: '_PaymentMethodsViewModelBase.moneyToLoad', context: context);

  @override
  double get moneyToLoad {
    _$moneyToLoadAtom.reportRead();
    return super.moneyToLoad;
  }

  @override
  set moneyToLoad(double value) {
    _$moneyToLoadAtom.reportWrite(value, super.moneyToLoad, () {
      super.moneyToLoad = value;
    });
  }

  late final _$_PaymentMethodsViewModelBaseActionController =
      ActionController(name: '_PaymentMethodsViewModelBase', context: context);

  @override
  dynamic isPressedEdit() {
    final _$actionInfo = _$_PaymentMethodsViewModelBaseActionController
        .startAction(name: '_PaymentMethodsViewModelBase.isPressedEdit');
    try {
      return super.isPressedEdit();
    } finally {
      _$_PaymentMethodsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selected: ${selected},
moneyToLoad: ${moneyToLoad}
    ''';
  }
}
