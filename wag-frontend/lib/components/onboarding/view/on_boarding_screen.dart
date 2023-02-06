import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/onboarding/view/widgets/local_generic_page_viewmodel.dart';
import 'package:flutter_boilerplate/components/register/view/register_screen.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_elevated_button.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_text_button.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';
import 'package:flutter_boilerplate/core/constants/app_sizes.dart';
import 'package:flutter_boilerplate/core/route/app_routes.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<PageViewModel> getPages = [
      LocalGenericPageViewModel()
          .getPageViewModel(imageTitle: AppStrings.INTRO_SCREEN_IMAGE1_NAME),
      LocalGenericPageViewModel()
          .getPageViewModel(imageTitle: AppStrings.INTRO_SCREEN_IMAGE1_NAME),
      LocalGenericPageViewModel()
          .getPageViewModel(imageTitle: AppStrings.INTRO_SCREEN_IMAGE1_NAME)
    ];
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: IntroductionScreen(
            pages: getPages,
            showSkipButton: true,
            overrideSkip: const SizedBox(),
            showDoneButton: false,
            showNextButton: false,
            dotsDecorator: DotsDecorator(
              size: AppSizes.smallDotSize,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppIntValues.TEN)),
              activeSize: AppSizes.bigDotSize,
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppIntValues.TEN)),
            ),
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 22, right: 19),
              child: Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                   Expanded(
                    child: Text(
                      AppStrings.INTRO_SCREEN_TITLE1,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 20, right: 19),
              child: Row(
                children: [
                  Expanded(
                      child: SFElevatedButton(
                    onPressedEB: () {
                      showMaterialModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return const RegisterScreen();
                        },
                      );
                      // Get.toNamed(AppRoutes.REGISTER_SCREEN);
                    },
                    childEB:  Text(AppStrings.REGISTER),
                  )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.5),
              child: SFTextButton(
                  onPressedFunc: () {
                    Get.toNamed(AppRoutes.LOGIN_SCREEN);
                  },
                  buttonChild:  Text(
                    AppStrings.LOGIN,
                    style: const TextStyle(color: AppColor.appBlue),
                  )),
            ),
          ],
        ),
      ],
    ));
  }
}
