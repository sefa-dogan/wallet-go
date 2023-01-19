import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'dark_and_white_brightness_viewmodel.g.dart';

// ignore: library_private_types_in_public_api
class DarkAndWhiteBrightness = _DarkAndWhiteBrightnessBase
    with _$DarkAndWhiteBrightness;

abstract class _DarkAndWhiteBrightnessBase with Store {
  @observable
  bool control = true;

  @action
  // ignore: no_leading_underscores_for_local_identifiers
  Brightness setBrightness(bool _control) {
    // control = AppStrings.pref.getBool("brightness")??true;

    return _control ? Brightness.light : Brightness.dark;
  }
}
