import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/brightness/viewmodel/dark_and_white_brightness_viewmodel.dart';
import 'package:flutter_boilerplate/locator.dart';
// import 'package:flutter_boilerplate/utils/constants/app_constants.dart';

class DarkAndWhiteBrightnessAppBar {
  final viewmodel = locator<DarkAndWhiteBrightness>();

  PreferredSizeWidget get darkAndWhiteModeAppBar {
    return AppBar(actions: [
      IconButton(
          onPressed: () {
            viewmodel.control = !viewmodel.control;
            // AppStrings.pref.setBool("brightness", viewmodel.control);
          },
          icon: const Icon(Icons.brightness_medium))
    ]);
  }
}
