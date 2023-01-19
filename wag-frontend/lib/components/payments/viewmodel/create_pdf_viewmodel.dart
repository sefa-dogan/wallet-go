import 'dart:io';

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import 'package:flutter_boilerplate/client.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/locator.dart';
import 'package:flutter_boilerplate/store/user/model/app_account.dart';
import 'package:flutter_boilerplate/store/user/model/transactions.dart';
import 'package:flutter_boilerplate/store/user/model/user_info.dart';
import 'package:flutter_boilerplate/store/user/viewmodel/user_store.dart';

part 'create_pdf_viewmodel.g.dart';

// ignore: library_private_types_in_public_api
class CreatePdfViewModel = _CreatePdfViewModelBase with _$CreatePdfViewModel;

abstract class _CreatePdfViewModelBase with Store {
  final userStore = locator<UserStore>();
  String paragraphText =
      'Adobe Systems Incorporated\'s Portable Document Format (PDF) is the de facto'
      'standard for the accurate, reliable, and platform-independent representation of a paged'
      'document. It\'s the only universally accepted file format that allows pixel-perfect layouts.'
      'In addition, PDF supports user interaction and collaborative workflows that are not'
      'possible with printed documents.';

// Create a new PDF document.
  late PdfDocument document;
  late PdfGridRow row;
  late PdfGridRow header;
  late UserInfo senderUserInfo;
  late UserInfo recipientUserInfo;

  late String path;
  Future<void> saveAndLaunchFile(List<int> bytes, String fileName) async {
    Directory? dir = await getApplicationDocumentsDirectory();

    path = dir.path;
    final file = File('$path/$fileName');
    await file.writeAsBytes(bytes, flush: true);
    OpenFile.open('$path/$fileName');
  }

  // Future<Directory?> getExternalStorageDirectory() async {
  //   final String? path = await _platform.getExternalStoragePath();
  //   if (path == null) {
  //     return null;
  //   }
  //   return Directory(path);
  // }

  // PdfDocument document = PdfDocument();

  Future<void> createPDF(Transaction transaction, AppAccount appAccount) async {
    await getSenderUserInfoId(transaction.walletId);
    await getRecipientWalletId(transaction.toAccountId);
    document = PdfDocument();
    final page = document.pages.add();
    PdfGrid grid = PdfGrid();
    grid.style = PdfGridStyle(
        font: PdfStandardFont(PdfFontFamily.helvetica, 30),
        cellPadding: PdfPaddings(left: 5, right: 2, top: 2, bottom: 2));
    grid.columns.add(count: 1);
    grid.headers.add(1);
    header = grid.headers[0];
    header.cells[0].value = 'WalletGo';

    row = grid.rows.add();
    row.cells[0].value =
        "Gonderenin ismi: ${senderUserInfo.name.toUpperCase()} ${senderUserInfo.surname.toUpperCase()}";
    // transaction.fromAccountId == appAccount.id
    //     ? "Gönderenin ismi: ${userStore.userInfo.name.toUpperCase()}"
    //     : "Gönderenin ismi: ${senderUserInfo.name.toUpperCase()}";
    row.height = 100;
    row = grid.rows.add();
    row.cells[0].value = "Gonderenin IBAN:  ${transaction.fromAccountId}";
    row.height = 100;

    row = grid.rows.add();
    row.cells[0].value =
        "Alicinin ismi: ${recipientUserInfo.name.toUpperCase()} ${recipientUserInfo.surname.toUpperCase()}";

    row.height = 100;

    row = grid.rows.add();
    row.cells[0].value = "Alicinin IBAN: ${transaction.toAccountId}";
    row.height = 100;

    row = grid.rows.add();
    row.cells[0].value = "Gonderilen tutar: \$${transaction.amount}";
    row.height = 100;

    grid.draw(page: page, bounds: const Rect.fromLTWH(0, 0, 0, 0));
    List<int> bytes = await document.save();
    document.dispose();
    await saveAndLaunchFile(bytes,
        '${DateFormat("yyyyMMdd").format(DateTime.parse(transaction.transactionDate))}.pdf');
  }

  Future<void> getSenderUserInfoId(String walletId) async {
    var response = await dioClient
        .get(AppStrings.GET_USER_INFO_ID_FROM_WALLET_PATH + walletId);
    if (response.statusCode == 200) {
      var userInfoId = response.data;
      senderUserInfo = await getNameAndSurname(userInfoId);
    }
  }

  Future<void> getRecipientUserInfoId(String walletId) async {
    var response = await dioClient
        .get(AppStrings.GET_USER_INFO_ID_FROM_WALLET_PATH + walletId);
    if (response.statusCode == 200) {
      var userInfoId = response.data;
      recipientUserInfo = await getNameAndSurname(userInfoId);
    }
  }

  Future<void> getRecipientWalletId(String toAccountId) async {
    var response = await dioClient
        .get(AppStrings.GET_WALLET_ID_FROM_APP_ACCOUNT_PATH + toAccountId);

    if (response.statusCode == 200) {
      var walletId = response.data;
      await getRecipientUserInfoId(walletId);
    }
  }

  Future<UserInfo> getNameAndSurname(String userInfoId) async {
    // ignore: prefer_typing_uninitialized_variables
    var userInfo;
    var response = await dioClient.get(AppStrings.USERS_INFO_PATH + userInfoId);
    if (response.statusCode == 200) {
      userInfo = UserInfo.fromMap(response.data);
    }
    return userInfo;
  }
}
