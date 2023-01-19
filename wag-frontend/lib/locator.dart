import 'package:flutter_boilerplate/components/brightness/viewmodel/dark_and_white_brightness_viewmodel.dart';
import 'package:flutter_boilerplate/components/filters/viewmodel/filters_viewmodel.dart';
import 'package:flutter_boilerplate/components/floating_action_button/viewmodel/sf_floating_action_button_viewmodel.dart';
import 'package:flutter_boilerplate/components/forgot_password/viewmoel/forgot_password_viewmodel.dart';
import 'package:flutter_boilerplate/components/home/viewmodel/home_viewmodel.dart';
import 'package:flutter_boilerplate/components/language/viewmodel/language_list_viewmodel.dart';
import 'package:flutter_boilerplate/components/light/viewmodel/light_viewmodel.dart';
import 'package:flutter_boilerplate/components/login/viewmodel/login_viewmodel.dart';
import 'package:flutter_boilerplate/components/notifications/viewmodel/notifications_viewmodel.dart';
import 'package:flutter_boilerplate/components/payment_methods/viewmodel/payment_methods_viewmodel.dart';
import 'package:flutter_boilerplate/components/payments/viewmodel/create_pdf_viewmodel.dart';
import 'package:flutter_boilerplate/components/payments/viewmodel/payments_viewmodel.dart';
import 'package:flutter_boilerplate/components/personal_details/viewmodel/personal_details_viewmodel.dart';
import 'package:flutter_boilerplate/components/register/viewmodel/register_viewmodel.dart';
import 'package:flutter_boilerplate/components/splash/view/splash_screen.dart';
import 'package:flutter_boilerplate/components/splash/viewmodel/splash_viewmodel.dart';
import 'package:flutter_boilerplate/store/bottomappbar/sf_bottom_app_bar_store.dart';
import 'package:flutter_boilerplate/store/user/viewmodel/user_store.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

setup() {
  locator.registerLazySingleton<DarkAndWhiteBrightness>(
      () => DarkAndWhiteBrightness());
  locator.registerLazySingleton<SplashScreen>(() => const SplashScreen());
  locator.registerLazySingleton<RegisterViewModel>(() => RegisterViewModel());
  locator.registerLazySingleton<LoginViewModel>(() => LoginViewModel());
  locator.registerLazySingleton<UserStore>(() => UserStore());
  locator
      .registerLazySingleton<SFBottomAppBarStore>(() => SFBottomAppBarStore());
  locator.registerLazySingleton<PaymentMethodsViewModel>(
      () => PaymentMethodsViewModel());
  locator.registerLazySingleton<LanguageListViewModel>(
      () => LanguageListViewModel());
  locator.registerLazySingleton<NotificationsViewModel>(
      () => NotificationsViewModel());
  locator.registerLazySingleton<SFFloatingActionButtonViewModel>(
      () => SFFloatingActionButtonViewModel());
  locator.registerLazySingleton<LightViewModel>(() => LightViewModel());
  locator.registerLazySingleton<FiltersViewModel>(() => FiltersViewModel());
  locator.registerLazySingleton<PersonalDetailsViewModel>(
      () => PersonalDetailsViewModel());
  locator.registerLazySingleton<PaymentsViewModel>(() => PaymentsViewModel());
  locator.registerLazySingleton<ForgotPasswordViewModel>(
      () => ForgotPasswordViewModel());
  locator.registerLazySingleton<HomeViewModel>(() => HomeViewModel());
  locator.registerLazySingleton<SplashViewModel>(() => SplashViewModel());
  locator.registerLazySingleton<CreatePdfViewModel>(() => CreatePdfViewModel());
}
