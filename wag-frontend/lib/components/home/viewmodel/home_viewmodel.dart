import 'package:flutter_boilerplate/locator.dart';
import 'package:flutter_boilerplate/store/user/model/app_account.dart';
import 'package:flutter_boilerplate/store/user/model/transactions.dart';
import 'package:flutter_boilerplate/store/user/viewmodel/user_store.dart';
import 'package:mobx/mobx.dart';

part 'home_viewmodel.g.dart';

// ignore: library_private_types_in_public_api
class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  final userStore = locator<UserStore>();

  @observable
  bool inProgress = true;

  late AppAccount currentAppAccount;

  getLastTransactions() async {
    await userStore.getLastTransactions();
    inProgress = false;
  }

  matchTransactionsAndAppAccounts(Transaction transaction) {
    // currentAppAccount = userStore.appAccounts
    //     .firstWhere((element) => element.id == transaction.fromAccountId);
    for (AppAccount account in userStore.appAccounts) {
      if (account.id == transaction.fromAccountId) {
        currentAppAccount = account;
        break;
      }
    }
  }
}
