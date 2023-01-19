import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate/store/user/model/app_account.dart';
import 'package:mobx/mobx.dart';
part 'payments_viewmodel.g.dart';

// ignore: library_private_types_in_public_api
class PaymentsViewModel = _PaymentsViewModelBase with _$PaymentsViewModel;

abstract class _PaymentsViewModelBase with Store {
  final controller = PageController(initialPage: 0);

  final indexPageAppAccountList = 0;
  final indexPageTransactionsList = 1;

  AppAccount? selectedAppAccount;
}
