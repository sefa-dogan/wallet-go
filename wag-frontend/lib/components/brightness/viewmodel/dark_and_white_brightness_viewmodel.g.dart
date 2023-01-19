// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dark_and_white_brightness_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DarkAndWhiteBrightness on _DarkAndWhiteBrightnessBase, Store {
  late final _$controlAtom =
      Atom(name: '_DarkAndWhiteBrightnessBase.control', context: context);

  @override
  bool get control {
    _$controlAtom.reportRead();
    return super.control;
  }

  @override
  set control(bool value) {
    _$controlAtom.reportWrite(value, super.control, () {
      super.control = value;
    });
  }

  late final _$_DarkAndWhiteBrightnessBaseActionController =
      ActionController(name: '_DarkAndWhiteBrightnessBase', context: context);

  @override
  Brightness setBrightness(bool _control) {
    final _$actionInfo = _$_DarkAndWhiteBrightnessBaseActionController
        .startAction(name: '_DarkAndWhiteBrightnessBase.setBrightness');
    try {
      return super.setBrightness(_control);
    } finally {
      _$_DarkAndWhiteBrightnessBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
control: ${control}
    ''';
  }
}
