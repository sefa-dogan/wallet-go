// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/register/model/app_account.dart';
import 'package:flutter_boilerplate/components/register/model/app_user.dart';
import 'package:flutter_boilerplate/components/register/model/user_info.dart';
import 'package:flutter_boilerplate/components/register/model/wallet.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/client.dart';
import 'package:flutter_boilerplate/core/exceptions/null_exception.dart';
import 'package:mobx/mobx.dart';
part 'register_viewmodel.g.dart';

class RegisterViewModel = _RegisterViewModelBase with _$RegisterViewModel;

abstract class _RegisterViewModelBase with Store {
  late List<AppUser> appUsers;
  late List<UserInfo> userInfoes;
  late List<Wallet> wallets;

  late AppUser appUser;
  late UserInfo userInfo;
  late Wallet wallet;
  late AppAccount appAccount;

  // ignore: unused_field
  late String _appUserId;
  late String _userInfoId;
  late String _walletId;
  // ignore: unused_field
  late String _appAccountId;

  @observable
  String username = "";
  @observable
  String name = "";
  @observable
  String surname = "";
  @observable
  String tcno = "";
  @observable
  String email = "";
  @observable
  String password = "";

  @observable
  bool showErrorMessageUsername = false;
  @observable
  bool showErrorMessageName = false;
  @observable
  bool showErrorMessageSurname = false;
  @observable
  bool showErrorMessageTcNo = false;
  @observable
  bool showErrorMessageEmail = false;
  @observable
  bool showErrorMessagePassword = false;

  @observable
  bool hidePassword = true;
  @observable
  bool inProgress = false;

  @action
  setUsername(String value) {
    username = value;
  }

  @action
  setName(String value) {
    name = value;
  }

  @action
  setSurname(String value) {
    surname = value;
  }

  @action
  setTcNo(String value) {
    tcno = value;
  }

  @action
  setEmail(String value) {
    email = value;
  }

  @action
  setPassword(String value) {
    password = value;
  }

  changeStateAllErrorText() {
    showErrorMessageEmail = true;
    showErrorMessageName = true;
    showErrorMessagePassword = true;
    showErrorMessageSurname = true;
    showErrorMessageTcNo = true;
    showErrorMessageUsername = true;
  }

  Map<String, dynamic> createAppUserAndConvertToMap() {
    appUser = AppUser(username: username, password: password);
    return appUser.toMap();
  }

  Map<String, dynamic> createUserInfoAndConvertToMap() {
    userInfo = UserInfo(
        appUserId: _appUserId,
        name: name,
        surname: surname,
        tcno: tcno,
        email: email);
    return userInfo.toMap();
  }

  Map<String, dynamic> createWalletAndConvertToMap() {
    wallet = Wallet(
        userInfoId: _userInfoId, name: AppStrings.MY_WALLET, balance: 0.0);
    return wallet.toMap();
  }

  Map<String, dynamic> createAccountAndConvertToMap() {
    appAccount = AppAccount(
        name: AppStrings.MY_ACCOUNT, balance: 0.0, walletId: _walletId);
    return appAccount.toMap();
  }

  @action
  Future getAppUsers() async {
    try {
      var response = await dioClient.get(AppStrings.APP_USERS_PATH);
      if (response.statusCode == 200) {
        Map pulledData = response.data;
        var pulledAppUsers = pulledData["items"];
        debugPrint(pulledAppUsers.toString());
        appUsers =
            (pulledAppUsers as List).map((e) => AppUser.fromMap(e)).toList();
      } else {
        debugPrint(
            "AppUsers GET ile çekilemedi; ${response.statusMessage}: ${response.statusCode}");
      }
    } catch (error) {
      debugPrint(error.toString());
      return Future.error(error);
    }
  }

  @action
  Future postAppUser() async {
    inProgress = true;
    try {
      if (username.isNotEmpty &&
          name.isNotEmpty &&
          surname.isNotEmpty &&
          email.isNotEmpty &&
          tcno.isNotEmpty &&
          password.isNotEmpty) {
        var response = await dioClient.post(AppStrings.APP_USERS_PATH,
            data: createAppUserAndConvertToMap());
        if (response.statusCode == 200) {
          var pushedData = response.data;
          _appUserId = pushedData["id"];
          await postUserInfo();
        } else {
          debugPrint(
              "AppUser, POST ile gönderilemedi; ${response.statusMessage}: ${response.statusCode}");
        }
      } else {
        throw NullException();
      }
    } catch (exp) {
      debugPrint("Hata: $exp");
      return Future.error(exp);
    }
  }

  Future postUserInfo() async {
    try {
      var response = await dioClient.post(AppStrings.USERS_INFO_PATH,
          data: createUserInfoAndConvertToMap());
      if (response.statusCode == 200) {
        var pushedData = response.data;
        _userInfoId = pushedData["id"];
        await postWallet();
      } else {
        debugPrint(
            "UserInfo, POST ile gönderilemedi; ${response.statusMessage}: ${response.statusCode}");
        throw Exception();
      }
    } catch (error) {
      debugPrint(error.toString());
      return Future.error(error);
    }
  }

  Future postWallet() async {
    try {
      var response = await dioClient.post(AppStrings.WALLETS_PATH,
          data: createWalletAndConvertToMap());
      if (response.statusCode == 200) {
        var pushedData = response.data;
        _walletId = pushedData["id"];
        await postAppAccount();
      } else {
        debugPrint(
            "Wallet, POST ile gönderilemedi; ${response.statusMessage}: ${response.statusCode}");
      }
    } catch (error) {
      debugPrint(error.toString());
      return Future.error(error);
    }
  }

  Future postAppAccount() async {
    try {
      var response = await dioClient.post(AppStrings.APP_ACCOUNTS_PATH,
          data: createAccountAndConvertToMap());
      if (response.statusCode == 200) {
        var pushedData = response.data;
        _appAccountId = pushedData["id"];
        inProgress = false;
        username = "";
        name = "";
        surname = "";
        tcno = "";
        email = "";
        password = "";
      } else {
        debugPrint(
            "AppAccount, POST ile gönderilemedi; ${response.statusMessage}: ${response.statusCode}");
      }
    } catch (error) {
      debugPrint(error.toString());
      return Future.error(error);
    }
  }
}
