import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_custom_alert.dart';
import 'package:flutter_boilerplate/components/atomic_widgets/sf_elevated_button.dart';
import 'package:flutter_boilerplate/components/splash/viewmodel/splash_viewmodel.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/core/route/app_routes.dart';
import 'package:flutter_boilerplate/locator.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final viewmodel = locator<SplashViewModel>();

  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 2),
        viewmodel.isLoggedIn()
            ? () async {
                try {
                  await Get.showOverlay(
                    asyncFunction: () async {
                      await viewmodel
                          .getAppUserId()
                          .timeout(const Duration(seconds: 10));
                    },
                    loadingWidget: const Center(
                      child: CircularProgressIndicator(),
                    ),
                    opacity: 0.5,
                    opacityColor: AppColor.appOverlayColor,
                  );
                } catch (exp) {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) => SFCustomAlert(
                        title: AppStrings.WE_ARE_SAD,
                        message: AppStrings.LOGIN_EXCEPTION,
                        actions: [
                          SFElevatedButton(
                            childEB: Text(AppStrings.OK),
                            onPressedEB: () => Get.offAllNamed(
                                AppRoutes.LOGIN_SCREEN,
                                arguments: [
                                  true,
                                  [viewmodel.username, viewmodel.password]
                                ]),
                          )
                        ],
                        imagePath: AppStrings.SAD_FACE_IMG),
                  );
                }
              }
            : () => Get.offAllNamed(AppRoutes.ONBOARDING_SCREEN));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBlue,
      body: Center(
        child: Text(AppStrings.APP_NAME,
            style: const TextStyle(color: Colors.white, fontSize: 25)),
      ),
    );
  }
}
