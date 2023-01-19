import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate/client.dart';
import 'package:flutter_boilerplate/components/light/model/transaction.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/locator.dart';
import 'package:flutter_boilerplate/store/user/model/app_account.dart';
import 'package:flutter_boilerplate/store/user/viewmodel/user_store.dart';
import 'package:mobx/mobx.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

part 'payment_methods_viewmodel.g.dart';

// ignore: library_private_types_in_public_api
class PaymentMethodsViewModel = _PaymentMethodsViewModelBase
    with _$PaymentMethodsViewModel;

abstract class _PaymentMethodsViewModelBase with Store {
  final userStore = locator<UserStore>();

  @observable
  bool selected = false;
  @observable
  double moneyToLoad = 0;

  late AppAccount selectedAppAccount;
  String newAppAccountName = "";
  bool isCompleted = false;

  PageController controller = PageController(initialPage: 0);

  @action
  isPressedEdit() {
    selected = !selected;
  }

  Future setAppAccountName() async {
    var response = await dioClient.put(
        AppStrings.UPDATE_APP_ACCOUNT_NAME_PATH + selectedAppAccount.id,
        queryParameters: {"name": newAppAccountName});
    if (response.statusCode == 200) {
      userStore.getAppAccounts();
      debugPrint("Card ismi güncellendi");
    }
  }

  Future loadMoney() async {
    if (moneyToLoad > 0) {
      try {
        var response = await dioClient.put(
            AppStrings.UPDATE_APP_ACCOUNT_BALANCE_PATH + selectedAppAccount.id,
            queryParameters: {"amount": moneyToLoad});
        if (response.statusCode == 200) {
          isCompleted = true;
          await updateWalletBalance();
          await postTrancaction();
          await userStore.getAppAccounts();
          debugPrint("Yönetici tarafindan para yüklendi para yüklendi");
        }
      } catch (exception) {
        debugPrint(exception.toString());
        return Future.error(exception);
      }
    } else {}
  }

  Future updateWalletBalance() async {
    try {
      var response = await dioClient.put(
          AppStrings.UPDATE_WALLET_BALANCE_PATH + userStore.wallet.id,
          queryParameters: {"money": moneyToLoad});
      if (response.statusCode == 200) {
        await userStore.getWallet();
      }
    } catch (exception) {
      debugPrint(exception.toString());
      return Future.error(exception);
    }
  }

  Map<String, dynamic> createTrancactionAndConvertToMap() {
    var transaction = Transaction(
        transactionDate:
            DateFormat('yyyy-MM-ddThh:mm:ss').format(DateTime.now()),
        fromAccountId: AppStrings.ADMIN_APP_ACCOUNT_ID,
        walletId: AppStrings.ADMIN_WALLET_ID,
        toAccountId: selectedAppAccount.id,
        amount: moneyToLoad);
    debugPrint(transaction.transactionDate.runtimeType.toString());
    return transaction.toMap();
  }

  Future postTrancaction() async {
    try {
      var data = createTrancactionAndConvertToMap();
      var response =
          await dioClient.post(AppStrings.TRANSACTIONS_PATH, data: data);
      if (response.statusCode == 200) {
        debugPrint("Trancaction oluşturuldu");
      }
    } catch (error) {
      debugPrint(error.toString());
      Future.error(error);
    }
  }
}
