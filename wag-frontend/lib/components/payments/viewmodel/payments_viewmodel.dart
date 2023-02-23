import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'package:flutter_boilerplate/client.dart';
import 'package:flutter_boilerplate/components/payments/model/template.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/locator.dart';
import 'package:flutter_boilerplate/store/user/model/app_account.dart';
import 'package:flutter_boilerplate/store/user/viewmodel/user_store.dart';

part 'payments_viewmodel.g.dart';

// ignore: library_private_types_in_public_api
class PaymentsViewModel = _PaymentsViewModelBase with _$PaymentsViewModel;

abstract class _PaymentsViewModelBase with Store {
  final userStore = locator<UserStore>();

  final indexPageAppAccountList = 0;
  final indexPageTransactionsList = 1;

  double amountForTemplate = 0;

  AppAccount? selectedAppAccountForTemplate;
  PageController? pageController;
  TabController? tabController;

  int currentPageIndex = 0;
  AppAccount? selectedAppAccount;
  @observable
  int currentTabIndex = 0;
  @observable
  bool showAmountErrorMessage = false;
  @observable
  bool showDeleteTemplateBox = false;

  @observable
  DateTime? fromDate;
  @observable
  DateTime? toDate;

  Map<String, dynamic> createTemplateAndConvertToMap() {
    var template = Template(
        amount: amountForTemplate,
        accountId: selectedAppAccountForTemplate!.id,
        walletId: userStore.wallet.id);
    return template.toMap();
  }

  Future postTemplate() async {
    try {
      var response = await dioClient.post(AppStrings.TEMPLATES_PATH,
          data: createTemplateAndConvertToMap());
      if (response.statusCode == 200) {
        await userStore.getTemplates();
        amountForTemplate = 0;
        showAmountErrorMessage = false;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future deleteTemplate(String templateId) async {
    try {
      var response =
          await dioClient.delete(AppStrings.TEMPLATES_PATH + templateId);
      if (response.statusCode == 200) {
        await userStore.getTemplates();
      }
    } catch (error) {
      return Future.error(error);
    }
  }

  Future getCurrentAccount(String accountId) async {
    var response =
        await dioClient.get(AppStrings.APP_ACCOUNTS_PATH + accountId);
  }
}
