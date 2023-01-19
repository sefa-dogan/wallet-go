import 'package:flutter_boilerplate/components/filters/view/filters_screen.dart';
import 'package:flutter_boilerplate/components/forgot_password/view/forgot_password_screen.dart';
import 'package:flutter_boilerplate/components/home/view/home_screen.dart';
import 'package:flutter_boilerplate/components/light/view/light_screen.dart';
import 'package:flutter_boilerplate/components/language/view/language_list_screen.dart';
import 'package:flutter_boilerplate/components/onboarding/view/on_boarding_screen.dart';
import 'package:flutter_boilerplate/components/login/view/login_screen.dart';
import 'package:flutter_boilerplate/components/notifications/view/notifications_list_screen.dart';
import 'package:flutter_boilerplate/components/payments/view/payments_screen.dart';
import 'package:flutter_boilerplate/components/payment_methods/view/payment_methods_list_screen.dart';
import 'package:flutter_boilerplate/components/personal_details/view/personal_details_list_screen.dart';
import 'package:flutter_boilerplate/components/profile/view/profile_list_screen.dart';
import 'package:flutter_boilerplate/components/register/view/register_screen.dart';
import 'package:flutter_boilerplate/components/scan_card/view/scan_card_screen.dart';
import 'package:flutter_boilerplate/components/splash/view/splash_screen.dart';
import 'package:flutter_boilerplate/components/success_payment/view/success_payment_screen.dart';
import 'package:flutter_boilerplate/core/route/app_routes.dart';
import 'package:get/get.dart';

List<GetPage> appRouter = <GetPage>[
  GetPage(
    name: AppRoutes.HOME_SCREEN,
    page: () => HomeScreen(),
  ),
  GetPage(
    name: AppRoutes.SPLASH_SCREEN,
    page: () => const SplashScreen(),
  ),
  GetPage(
    name: AppRoutes.ONBOARDING_SCREEN,
    page: () => const OnBoardingScreen(),
  ),
  GetPage(
    name: AppRoutes.REGISTER_SCREEN,
    page: () => const RegisterScreen(),
  ),
  GetPage(
    name: AppRoutes.LOGIN_SCREEN,
    page: () => LoginScreen(),
  ),
  GetPage(
    name: AppRoutes.PAYMENTS_SCREEN,
    page: () => PaymentsScreen(),
  ),
  GetPage(
    name: AppRoutes.NOTIFICATIONS_LIST_SCREEN,
    page: () => NotificationsListScreen(),
  ),
  GetPage(
    name: AppRoutes.PROFILE_SCREEN,
    page: () => ProfileListScreen(),
  ),
  GetPage(
    name: AppRoutes.PERSONAL_DETAILS_LIST_SCREEN,
    page: () => PersonalDetailsListScreen(),
  ),
  GetPage(
    name: AppRoutes.PAYMENT_METHODS_LIST_SCREEN,
    page: () => PaymentMethodsListScreen(),
  ),
  GetPage(
    name: AppRoutes.LANGUAGE_LIST_SCREEN,
    page: () => LanguageListScreen(),
  ),
  GetPage(
    name: AppRoutes.LIGHT_SCREEN,
    page: () => LightScreen(),
  ),
  GetPage(
    name: AppRoutes.FILTERS_SCREEN,
    page: () => const FiltersScreen(),
  ),
  GetPage(
    name: AppRoutes.SCAN_CARD_SCREEN,
    page: () => const ScanCardScreen(),
  ),
  GetPage(
    name: AppRoutes.SUCCESS_PAYMENT_SCREEN,
    page: () => SuccessPaymentScreen(),
  ),
  GetPage(
    name: AppRoutes.FORGOT_PASSWORD_SCREEN,
    page: () => const ForgotPasswordScreen(),
  ),
];
