import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/client.dart';

import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/store/user/model/app_account.dart';
import 'package:flutter_boilerplate/store/user/model/app_user.dart';
import 'package:flutter_boilerplate/store/user/model/transactions.dart';
import 'package:flutter_boilerplate/store/user/model/user_info.dart';
import 'package:flutter_boilerplate/store/user/model/wallet.dart';
import 'package:mobx/mobx.dart';
part 'user_store.g.dart';

// ignore: library_private_types_in_public_api
class UserStore = _UserStoreBase with _$UserStore;

abstract class _UserStoreBase with Store {
  late AppUser appUser; //
  late UserInfo userInfo; //
  late Wallet wallet; //
  late List<AppAccount> appAccounts = [];
  late List<Transaction> transactions = [];
  late List<Transaction> lastTransactions = [];

  String appUserId = ""; // end pointten çekilen AppUser idsi burada tutulur
  String userInfoId = ""; // endpointten çekilen UserInfo idsi burada tutulur
  String walletId = ""; //  endpointten çekilen Wallet idsi burada tutulur.
  List<dynamic> appAccountIds =
      []; // endpointten çekilen AppAccount idleri burada tutulur
  // List<Transaction> fromTransactions = [];
  // List<Transaction> toTransactions = [];

  Future getAppUser() async {
    var response = await dioClient.get(AppStrings.APP_USERS_PATH + appUserId);
    if (response.statusCode == 200) {
      Map<String, dynamic> pulledData = response.data;
      appUser = AppUser.fromMap(pulledData);
    }
  }

  ///adsfdsfsdf
  Future getUserInfo() async {
    var response = await dioClient.get(AppStrings.USERS_INFO_PATH + userInfoId);
    if (response.statusCode == 200) {
      Map<String, dynamic> pulledData = response.data;
      userInfo = UserInfo.fromMap(pulledData);
    } else {
      debugPrint(
          "UserInfo GET ile çekilemedi; ${response.statusMessage}: ${response.statusCode}");
    }
  }

  Future getWallet() async {
    var response = await dioClient.get(AppStrings.WALLETS_PATH + walletId);
    if (response.statusCode == 200) {
      Map<String, dynamic> pulledData = response.data;
      debugPrint(pulledData["balance"].runtimeType.toString());
      wallet = Wallet.fromMap(pulledData);
      var value = double.tryParse(pulledData['balance'].runtimeType == int
          ? "${pulledData['balance']}.00"
          : pulledData['balance'].toString());
      debugPrint(value.runtimeType.toString());
    } else {
      debugPrint(
          "Wallet GET ile çekilemedi; ${response.statusMessage}: ${response.statusCode}");
    }
  }

  Future getAppAccounts() async {
    appAccounts = [];
    for (var id in appAccountIds) {
      var response = await dioClient.get(AppStrings.APP_ACCOUNTS_PATH + id);
      if (response.statusCode == 200) {
        Map<String, dynamic> pulledData = response.data;
        appAccounts.add(AppAccount.fromMap(pulledData));
      } else {
        debugPrint(
            "AppAccounts GET ile çekilemedi; ${response.statusMessage}: ${response.statusCode}");
      }
    }
  }

  Future getTransactions(AppAccount appAccount) async {
    transactions = [];
    var response = await dioClient
        .get(AppStrings.GET_ALL_TRANSACTIONS_PATH + appAccount.id);
    if (response.statusCode == 200) {
      transactions =
          (response.data as List).map((e) => Transaction.fromMap(e)).toList();
    } else {
      debugPrint(AppStrings.ERROR_MESSAGE_SOMETHING_WENT_WRONG);
    }
  }

  Future getLastTransactions() async {
    lastTransactions = [];
    var response =
        await dioClient.get(AppStrings.GET_LAST_PAYMENTS_PATH + wallet.id);
    if (response.statusCode == 200) {
      lastTransactions =
          (response.data as List).map((e) => Transaction.fromMap(e)).toList();
    } else {
      debugPrint(AppStrings.ERROR_MESSAGE_SOMETHING_WENT_WRONG);
    }
  }

  // matchTransactionsAndAppAccounts() {
  //   var result = appAccounts.firstWhere((element) {
  //     element.id == "sfgsgsd";
  //   });
  // }
}
