// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

import 'package:flutter_boilerplate/client.dart';
import 'package:flutter_boilerplate/components/light/model/transaction.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/core/exceptions/balance_exception.dart';
import 'package:flutter_boilerplate/core/exceptions/invalid_iban_exception.dart';
import 'package:flutter_boilerplate/core/exceptions/null_exception.dart';
import 'package:flutter_boilerplate/locator.dart';
import 'package:flutter_boilerplate/store/user/model/app_account.dart';
import 'package:flutter_boilerplate/store/user/viewmodel/user_store.dart';

part 'light_viewmodel.g.dart';

// ignore: library_private_types_in_public_api
class LightViewModel = _LightViewModelBase with _$LightViewModel;

abstract class _LightViewModelBase with Store {
  final userStore = locator<UserStore>();

  // late PageView pageView;
  late PageController controller;
  int pageIndexChoosePaymentMethodList = 0;
  int pageIndexChooseSmartCardList = 1;
  int pageIndexChooseCurrencyList = 2;
  int pageIndexAddNewPaymentMethodForm = 3;
  int pageIndexWhatIsCvvCvcCode = 4;
  bool isCompleted = false;

  AppAccount? selectedAppAccount;

  @observable
  String iban = "";
  @observable
  double? amount;

  @observable
  bool showPaymentMethodErrorText = false;
  @observable
  bool showSmartCardErrorText = false;
  @observable
  bool showAmountErrorText = false;
  @observable
  bool showIbanErrorText = false;
  @observable
  bool showCurrencyErrorText = false;

  @observable
  bool inProgress = false;
  @observable
  int? indexPaymentMethod;
  @observable
  int? indexSmartCard;
  @observable
  int? indexCurrency;
  @observable
  String? selectedCurrency;
  @observable
  bool? stateCheckBox = false;
  @observable
  String? smartCardTextFieldText;
  @observable
  String? paymentMethodTextFieldText;

  @action
  setSmartCardTextFieldText() {
    if (indexSmartCard != null) {
      controller.animateToPage(pageIndexChooseCurrencyList,
          duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
      smartCardTextFieldText = userStore.appAccounts[indexSmartCard!].name;
    }
  }

  @action
  setPaymentMethodTextFieldText() {
    controller.animateToPage(pageIndexChooseSmartCardList,
        duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
    paymentMethodTextFieldText = userStore.wallet.name;
  }

  @action
  Future startTransfer() async {
    //amountsdgsahsaf
    try {
      if (iban.isNotEmpty && amount != null && selectedAppAccount != null) {
        if (selectedAppAccount!.balance >= amount!) {
          inProgress = true;
          var isCompletedTransfer =
              await updateAppAccountBalance(iban, amount!);
          if (isCompletedTransfer) {
            debugPrint("Transfer gerçekleşti.");
            var isMyBalanceDecreased =
                await updateAppAccountBalance(selectedAppAccount!.id, -amount!);
            var isWalletBalanceDecreased = await updateWalletBalance(-amount!);
            if (isMyBalanceDecreased && isWalletBalanceDecreased) {
              await postTrancaction();
              inProgress = false;
              isCompleted = true;
              debugPrint("Hesabinizdan para gitti");
            }
          } else {
            debugPrint("Böyle bir IBAN  bulunamadi.");
            throw InvalidIbanException();
          }
        } else {
          debugPrint("Bakiyeniz yetersiz!");
          throw BalanceException();
        }
      } else {
        debugPrint("Lütfen gerekli bilgileri doldurunuz.");
        showAllError();
        throw NullException();
      }
    } catch (error) {
      debugPrint(error.toString());
      return Future.error(error);
    }
  }

  showAllError() {
    showPaymentMethodErrorText = true;
    showSmartCardErrorText = true;
    showAmountErrorText = true;
    showIbanErrorText = true;
    showCurrencyErrorText = true;
  }

  Future<bool> updateAppAccountBalance(String _iban, double _amount) async {
    try {
      var response = await dioClient.put(
          AppStrings.UPDATE_APP_ACCOUNT_BALANCE_PATH + _iban,
          queryParameters: {"amount": _amount});
      return response.data;
    } catch (error) {
      debugPrint(error.toString());
      return Future.error(error);
    }
  }

  Future<bool> updateWalletBalance(double moneyToLoad) async {
    try {
      var response = await dioClient.put(
          AppStrings.UPDATE_WALLET_BALANCE_PATH + userStore.wallet.id,
          queryParameters: {"money": moneyToLoad});
      if (response.statusCode == 200) {
        await userStore.getWallet();
      }
      return response.data;
    } catch (exception) {
      debugPrint(exception.toString());
      return Future.error(exception);
    }
  }

  Map<String, dynamic> createTrancactionAndConvertToMap() {
    var transaction = Transaction(
        transactionDate:
            DateFormat('yyyy-MM-ddThh:mm:ss').format(DateTime.now()),
        fromAccountId: selectedAppAccount!.id,
        walletId: selectedAppAccount!.walletId,
        toAccountId: iban,
        amount: amount!);
    debugPrint(transaction.transactionDate.runtimeType.toString());
    return transaction.toMap();
  }

  Future postTrancaction() async {
    try {
      var _data = createTrancactionAndConvertToMap();
      var response =
          await dioClient.post(AppStrings.TRANSACTIONS_PATH, data: _data);
      if (response.statusCode == 200) {
        debugPrint("Trancaction oluşturuldu");
      }
    } catch (error) {
      debugPrint(error.toString());
      Future.error(error);
    }
  }
}
