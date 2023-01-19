import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_boilerplate/components/brightness/viewmodel/dark_and_white_brightness_viewmodel.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_int_values.dart';
import 'package:flutter_boilerplate/core/constants/shared_preferences.dart';
import 'package:flutter_boilerplate/core/route/app_router.dart';
import 'package:flutter_boilerplate/core/route/app_routes.dart';
import 'package:flutter_boilerplate/locator.dart';

// ignore: todo
//TODO FlutterError (Scaffold.geometryOf() must only be accessed during the paint phase.
// The ScaffoldGeometry is only available during the paint phase, because its value is computed during the animation and layout phases prior to painting.)  sayfalar arası art arda çok fazla route işlemi yapılınca bu hata geliyor. Burası düzeltilecek.

void main() async {
  setup();
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  // await getAvaibleCameras();
  prefs = await SharedPreferences.getInstance();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final viewmodel = locator<DarkAndWhiteBrightness>();
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: AppColor.appWhite,
            brightness: viewmodel.setBrightness(viewmodel.control),
            bottomSheetTheme: const BottomSheetThemeData(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(AppIntValues.TEN))))),
        initialRoute: AppRoutes.SPLASH_SCREEN,
        getPages: appRouter,
        builder: EasyLoading.init(),
      );
    });
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
