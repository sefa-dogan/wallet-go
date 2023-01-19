import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_app_bar.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_elevated_button.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';

class ScanCardScreen extends StatefulWidget {
  const ScanCardScreen({super.key});

  @override
  State<ScanCardScreen> createState() => _ScanCardScreenState();
}

class _ScanCardScreenState extends State<ScanCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: Image.asset(
          AppStrings.SCAN_CARD_BACKGROUND,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
      ),
      Scaffold(
        backgroundColor: AppColor.appTransparent,
        appBar: SFAppBar()
            .appBar(AppStrings.SCAN_THE_CARD, appBarTheme: AppColor.appWhite),
        body: Padding(
          padding: const EdgeInsets.only(
              left: AppIntValues.TWENTY, right: AppIntValues.TWENTY),
          child: Column(
            children: [
              Row(
                children: const [
                  Text(
                    AppStrings.SCAN_SCREEN_TEXT,
                    style: TextStyle(color: AppColor.appWhite),
                  ),
                ],
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(
                    top: AppIntValues.FIFTY, bottom: AppIntValues.FIFTY),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.appBlack,
                    border: Border.all(color: AppColor.appWhite),
                  ),
                ),
              )),
              SFElevatedButton(
                childEB: const Text(AppStrings.ADD_IMAGE),
                onPressedEB: () {},
              )
            ],
          ),
        ),
      ),
    ]);
  }
}
