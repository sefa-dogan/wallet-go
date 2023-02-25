import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/client.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/core/constants/shared_preferences.dart';
import 'package:flutter_boilerplate/core/exceptions/invalid_password_exception.dart';
import 'package:flutter_boilerplate/core/route/app_routes.dart';
import 'package:flutter_boilerplate/locator.dart';
import 'package:flutter_boilerplate/store/user/viewmodel/user_store.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
part 'splash_viewmodel.g.dart';

// ignore: library_private_types_in_public_api
class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store {
  final userStore = locator<UserStore>();
  late bool isRegistered;

  String username = "";
  String password = "";

  bool isLoggedIn() {
    username = SharedPref.prefs.getString("username")!;
    password = SharedPref.prefs.getString("password")!;

    if (username != "" && password != "") {
      return true;
    } else {
      return false;
    }
  }

/*   Future isUserRegistered() async {
    try {
      if (username.isNotEmpty && password.isNotEmpty) {
        var response = await dioClient.post(
          AppStrings.IS_USER_REGISTERED_PATH,
          queryParameters: {"username": username},
        );

        if (response.statusCode == 200) {
          isRegistered = response.data;
          debugPrint(response.data.toString());
          isRegistered ? await getAppUserId() : throw LoginException();
        }
      } else {
        throw NullException();
      }
    } catch (error) {
      debugPrint(error.toString());
      return Future.error(error);
    }
  } */

  Future getAppUserId() async {
    try {
      var response = await dioClient.get(AppStrings.GET_APP_USER_ID_PATH,
          queryParameters: {"username": username});
      if (response.statusCode == 200) {
        userStore.appUserId = response.data;
        await userStore.getAppUser();
        userStore.appUser.password == password
            ? await getUserInfoId()
            : throw InvalidPasswordException();
      } else {
        debugPrint(
            "Id bilgisi çekilemedi ${response.statusCode}: ${response.statusMessage}");
      }
    } catch (error) {
      debugPrint(error.toString());
      return Future.error(error);
    }
  }

  Future getUserInfoId() async {
    try {
      var response = await dioClient
          .get(AppStrings.GET_USER_INFO_ID_PATH + userStore.appUserId);
      if (response.statusCode == 200) {
        userStore.userInfoId = response.data;
        await userStore.getUserInfo();
        await getWalletId();
      }
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  Future getWalletId() async {
    try {
      var response = await dioClient
          .get(AppStrings.GET_WALLET_ID_PATH + userStore.userInfoId);
      if (response.statusCode == 200) {
        userStore.walletId = response.data;
        await userStore.getWallet();
        await userStore.getTemplates();
        await getAppAccountIds();
      }
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  Future getAppAccountIds() async {
    try {
      var response = await dioClient
          .get(AppStrings.GET_APP_ACCOUNTS_IDS_PATH + userStore.walletId);
      if (response.statusCode == 200) {
        userStore.appAccountIds = response.data;
        await userStore.getAppAccounts();
        await userStore.getLastTransactions();
        Get.offAllNamed(AppRoutes.HOME_SCREEN);
      }
    } catch (error) {
      debugPrint(error.toString());
    }
  }
}
