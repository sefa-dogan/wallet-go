import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get_connect/sockets/src/socket_notifier.dart';
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
import 'package:flutter/services.dart';

part 'create_pdf_viewmodel.g.dart';

// ignore: library_private_types_in_public_api
class CreatePdfViewModel = _CreatePdfViewModelBase with _$CreatePdfViewModel;

abstract class _CreatePdfViewModelBase with Store {
  final userStore = locator<UserStore>();

// Create a new PDF document.
  late PdfDocument document;
  late PdfGridRow row;
  late PdfGridRow header;
  late UserInfo senderUserInfo;
  late UserInfo recipientUserInfo;

  String previousPdfFileName = "";

  late String path;
  Future<void> saveAndLaunchFile(List<int> bytes, String fileName) async {
    Directory? dir = await getApplicationDocumentsDirectory();
    path = dir.path;
    final file = File('$path/$fileName');

    if (previousPdfFileName == fileName) {
      OpenFile.open('$path/$fileName');
    } else {
      await file.writeAsBytes(bytes, flush: true);
      OpenFile.open('$path/$fileName');
      previousPdfFileName = fileName;
    }
  }

  Future<List<int>> _readFontData() async {
    final ByteData bytes = await rootBundle.load(AppStrings.PDF_FONT);
    return bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
  }

  Future<void> createPDF(Transaction transaction, AppAccount appAccount) async {
    await getSenderUserInfoId(transaction.walletId);
    await getRecipientWalletId(transaction.toAccountId);
    document = PdfDocument();
    final PdfFont font = PdfTrueTypeFont(await _readFontData(), 12);

    final page = document.pages.add();
    PdfGrid grid = PdfGrid();
    grid.style = PdfGridStyle(
        font: font,
        cellPadding: PdfPaddings(left: 5, right: 2, top: 2, bottom: 2));
    grid.columns.add(count: 1);
    grid.headers.add(1);
    header = grid.headers[0];
    header.cells[0].value = AppStrings.APP_NAME;

    row = grid.rows.add();
    row.cells[0].value =
        "Gonderenin ismi: ${senderUserInfo.name.toUpperCase()} ${senderUserInfo.surname.toUpperCase()}";
    row.height = 50;
    row = grid.rows.add();
    row.cells[0].value = "Gonderenin IBAN:  ${transaction.fromAccountId}";
    row.height = 50;

    row = grid.rows.add();
    row.cells[0].value =
        "Alicinin ismi: ${recipientUserInfo.name.toUpperCase()} ${recipientUserInfo.surname.toUpperCase()}";

    row.height = 50;

    row = grid.rows.add();
    row.cells[0].value = "Alicinin IBAN: ${transaction.toAccountId}";
    row.height = 50;

    row = grid.rows.add();
    row.cells[0].value = "Gonderilen tutar: \$${transaction.amount}";
    row.height = 50;

    grid.draw(page: page, bounds: const Rect.fromLTWH(0, 0, 0, 0));
    List<int> bytes = await document.save();
    document.dispose();

    await saveAndLaunchFile(bytes,
        '${DateFormat("yyyyMMddhhmmss").format(DateTime.parse(transaction.transactionDate))}.pdf');
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
