import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/client.dart';
import 'package:flutter_boilerplate/components/payments/model/template.dart';
import 'package:flutter_boilerplate/core/constants/app_colors.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/locator.dart';
import 'package:flutter_boilerplate/store/user/model/app_account.dart';
import 'package:flutter_boilerplate/store/user/viewmodel/user_store.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
part 'payments_viewmodel.g.dart';

// ignore: library_private_types_in_public_api
class PaymentsViewModel = _PaymentsViewModelBase with _$PaymentsViewModel;

abstract class _PaymentsViewModelBase with Store {
  final userStore = locator<UserStore>();
  final controller = PageController(initialPage: 0);

  final indexPageAppAccountList = 0;
  final indexPageTransactionsList = 1;

  AppAccount? selectedAppAccount;
  AppAccount? selectedAppAccountForTemplate;
  TabController? tabController;

  double amountForTemplate = 0;
  @observable
  int currentTabIndex = 0;
  @observable
  bool showAmountErrorMessage = false;
  @observable
  bool showDeleteTemplateBox = false;

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
    } catch (e) {}
  }

  Future getCurrentAccount(String accountId) async {
    var response =
        await dioClient.get(AppStrings.APP_ACCOUNTS_PATH + accountId);
  }
}
