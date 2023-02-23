// ignore_for_file: ant_identifier_names, non_constant_identifier_names

import 'package:flutter_boilerplate/localizations/app_localizations.dart';

class AppStrings {
  static String ADMIN_APP_ACCOUNT_ID = "96569452-a3ba-fa4e-8cea-3a0898688b95";
  static String ADMIN_WALLET_ID = "96569452-a3ba-fa4e-8cea-3a0898688b94";

  static String BASE_URL = "http://192.168.1.38:5000/";
  static String APP_USERS_PATH = "api/app/app-user/";
  static String IS_USER_REGISTERED_PATH = "api/app/app-user/is-registered/";
  static String USERS_INFO_PATH = "api/app/user-info/";
  static String WALLETS_PATH = "api/app/wallet/";
  static String APP_ACCOUNTS_PATH = "api/app/app-account/";
  static String TEMPLATES_PATH = "api/app/template/";
  static String GET_WALLET_ID_FROM_APP_ACCOUNT_PATH =
      "api/app/app-account/get-wallet-id/";
  static String TRANSACTIONS_PATH = "api/app/transaction/";
  static String GET_APP_USER_ID_PATH = "api/app/app-user/get-user-id/";
  static String GET_USER_INFO_ID_PATH = "api/app/user-info/get-user-info-id/";
  static String GET_USER_INFO_ID_FROM_WALLET_PATH =
      "api/app/wallet/get-user-info-id/";
  static String GET_WALLET_ID_PATH = "api/app/wallet/get-wallet-id/";
  static String GET_APP_ACCOUNTS_IDS_PATH =
      "api/app/app-account/get-accounts-id/";
  static String GET_TRANSACTIONS_IDS_PATH =
      "api/app/transaction/get-transactions-id/";
  static String GET_ALL_TRANSACTIONS_PATH =
      "api/app/transaction/get-all-transactions/";
  static String GET_LAST_PAYMENTS_PATH =
      "api/app/transaction/get-last-payments/";
  static String GET_TEMPLATES_PATH = "api/app/template/get-templates/";
  static String UPDATE_APP_ACCOUNT_BALANCE_PATH =
      "api/app/app-account/update-balance/";
  static String UPDATE_APP_ACCOUNT_NAME_PATH =
      "api/app/app-account/update-name/";
  static String UPDATE_WALLET_BALANCE_PATH = "api/app/wallet/update-balance/";
  static String USER_PROFILE_PICTURE = "assets/user.png";
  static String INTRO_SCREEN_IMAGE1_NAME = "assets/bg.png";
  static String EXCLAMATION_ICON = "assets/exclamation_icon.png";
  static String RECTANGLE = "assets/rectangle.png";
  static String CARD_CVV = "assets/card.png";
  static String SCAN_CARD_BACKGROUND = "assets/scan_card_background.jpg";
  static String SUCCESS_PAYMENT = "assets/success.png";
  static String CHECK = "assets/check.png";
  static String SAD_FACE = "assets/sad_face.jpg";
  static String PDF_FONT = "assets/fonts/Roboto-Thin.ttf";

// http metotlarında data parametresinde kullanılır

  static String id = AppLocalizations.localedStrings["id"]; // "id";
  static String appUserId =
      AppLocalizations.localedStrings["appUserId"]; //"appUserId";
  static String name = AppLocalizations.localedStrings["name"]; //"name";
  static String surname =
      AppLocalizations.localedStrings["surname"]; //"surname";
  static String tcno = AppLocalizations.localedStrings["tcno"]; //"tcno";
  static String email = AppLocalizations.localedStrings["email"]; //"email";
// http metotlarında data parametresinde kullanılır

  static String balance = AppLocalizations.localedStrings["balance"];
  static String LANGUAGE_CHANGE =
      AppLocalizations.localedStrings["LANGUAGE_CHANGE"];
  static String TURKISH = AppLocalizations.localedStrings["TURKISH"];
  static String ENGLISH = AppLocalizations.localedStrings["ENGLISH"];
  static String APP_NAME = AppLocalizations.localedStrings["APP_NAME"];
  static String MY_WALLET = AppLocalizations.localedStrings["MY_WALLET"];
  static String MY_ACCOUNT = AppLocalizations.localedStrings["MY_ACCOUNT"];
  static String INTRO_SCREEN_TITLE1 =
      AppLocalizations.localedStrings["INTRO_SCREEN_TITLE1"];
  static String ENTER_USERNAME_OR_E_MAIL =
      AppLocalizations.localedStrings["ENTER_USERNAME_OR_E_MAIL"];

  static String ENTER_E_MAIL = AppLocalizations.localedStrings["ENTER_E_MAIL"];
  static String ENTER_USERNAME =
      AppLocalizations.localedStrings["ENTER_USERNAME"];
  static String ENTER_NAME = AppLocalizations.localedStrings["ENTER_NAME"];
  static String ENTER_SURNAME =
      AppLocalizations.localedStrings["ENTER_SURNAME"];
  static String ENTER_PASSWORD =
      AppLocalizations.localedStrings["ENTER_PASSWORD"];
  static String ENTER_TC_NO = AppLocalizations.localedStrings["ENTER_TC_NO"];

  static String LOGIN = AppLocalizations.localedStrings["LOGIN"];
  static String SIGN_OUT = AppLocalizations.localedStrings["SIGN_OUT"];
  static String REGISTER = AppLocalizations.localedStrings["REGISTER"];
  static String TC_NO = AppLocalizations.localedStrings["TC_NO"];
  static String USERNAME = AppLocalizations.localedStrings["USERNAME"];
  static String NAME = AppLocalizations.localedStrings["NAME"];
  static String SURNAME = AppLocalizations.localedStrings["SURNAME"];
  static String E_MAIL = AppLocalizations.localedStrings["E_MAIL"];
  static String PASSWORD = AppLocalizations.localedStrings["PASSWORD"];
  static String NAME_AND_SURNAME =
      AppLocalizations.localedStrings["NAME_AND_SURNAME"];
  static String USERNAME_OR_E_MAIL =
      AppLocalizations.localedStrings["USERNAME_OR_E_MAIL"];
  static String CREATE_ACCOUNT =
      AppLocalizations.localedStrings["CREATE_ACCOUNT"];
  static String HAVE_ACCOUNT = AppLocalizations.localedStrings["HAVE_ACCOUNT"];
  static String FORGOT_PASSWORD =
      AppLocalizations.localedStrings["FORGOT_PASSWORD"];
  static String HAVE_NOT_ACCOUNT =
      AppLocalizations.localedStrings["HAVE_NOT_ACCOUNT"];
  static String HOME = AppLocalizations.localedStrings["HOME"];
  static String PAYMENTS = AppLocalizations.localedStrings["PAYMENTS"];
  static String TRANSACTIONS = AppLocalizations.localedStrings["TRANSACTIONS"];
  static String NOTIFICATIONS =
      AppLocalizations.localedStrings["NOTIFICATIONS"];
  static String PROFILE = AppLocalizations.localedStrings["PROFILE"];
  static String QUICK_ACTIONS =
      AppLocalizations.localedStrings["QUICK_ACTIONS"];
  static String PAY_BILLS = AppLocalizations.localedStrings["PAY_BILLS"];
  static String INCREASE_BALANCE =
      AppLocalizations.localedStrings["INCREASE_BALANCE"];
  static String PAYMENTS_TEMPLATE =
      AppLocalizations.localedStrings["PAYMENTS_TEMPLATE"];
  static String SMART_CARDS = AppLocalizations.localedStrings["SMART_CARDS"];
  static String SMART_CARDS_UPPERCASE =
      AppLocalizations.localedStrings["SMART_CARDS_UPPERCASE"];
  static String ADD_NEW_CARD = AppLocalizations.localedStrings["ADD_NEW_CARD"];

  static String LATEST_PAYMENTS =
      AppLocalizations.localedStrings["LATEST_PAYMENTS"];
  static String ERROR_MESSAGE_PASSWORD =
      AppLocalizations.localedStrings["ERROR_MESSAGE_PASSWORD"];
  static String ERROR_MESSAGE_USERNAME =
      AppLocalizations.localedStrings["ERROR_MESSAGE_USERNAME"];
  static String ERROR_MESSAGE_NAME =
      AppLocalizations.localedStrings["ERROR_MESSAGE_NAME"];
  static String ERROR_MESSAGE_SURNAME =
      AppLocalizations.localedStrings["ERROR_MESSAGE_SURNAME"];
  static String ERROR_MESSAGE_EMAIL =
      AppLocalizations.localedStrings["ERROR_MESSAGE_EMAIL"];
  static String ERROR_MESSAGE_TC_NO =
      AppLocalizations.localedStrings["ERROR_MESSAGE_TC_NO"];
  static String ERROR_MESSAGE_NAME_SURNAME =
      AppLocalizations.localedStrings["ERROR_MESSAGE_NAME_SURNAME"];
  static String ERROR_MESSAGE_PAYMENT_METHOD =
      AppLocalizations.localedStrings["ERROR_MESSAGE_PAYMENT_METHOD"];
  static String ERROR_MESSAGE_SMART_CARD =
      AppLocalizations.localedStrings["ERROR_MESSAGE_SMART_CARD"];
  static String ERROR_MESSAGE_AMOUNT =
      AppLocalizations.localedStrings["ERROR_MESSAGE_AMOUNT"];
  static String ERROR_MESSAGE_IBAN =
      AppLocalizations.localedStrings["ERROR_MESSAGE_IBAN"];
  static String ERROR_MESSAGE_CURRENCY =
      AppLocalizations.localedStrings["ERROR_MESSAGE_CURRENCY"];
  static String ERROR_MESSAGE_SOMETHING_WENT_WRONG =
      AppLocalizations.localedStrings["ERROR_MESSAGE_SOMETHING_WENT_WRONG"];
  static String INVALID_AMOUNT =
      AppLocalizations.localedStrings["INVALID_AMOUNT"];
  static String LOGIN_EXCEPTION =
      AppLocalizations.localedStrings["LOGIN_EXCEPTION"];
  static String VALIDATION_ERROR =
      AppLocalizations.localedStrings["VALIDATION_ERROR"];
  static String REQUIRED_TC_ID =
      AppLocalizations.localedStrings["REQUIRED_TC_ID"];
  static String PERSONAL_DETAILS =
      AppLocalizations.localedStrings["PERSONAL_DETAILS"];
  static String PAYMENT_METHODS =
      AppLocalizations.localedStrings["PAYMENT_METHODS"];
  static String PAYMENT_METHOD =
      AppLocalizations.localedStrings["PAYMENT_METHOD"];
  static String LANGUAGE = AppLocalizations.localedStrings["LANGUAGE"];
  static String RESET_PASSWORD =
      AppLocalizations.localedStrings["RESET_PASSWORD"];
  static String APPLY = AppLocalizations.localedStrings["APPLY"];
  static String PAY = AppLocalizations.localedStrings["PAY"];
  static String ADD_NEW_PAYMENT_METHOD =
      AppLocalizations.localedStrings["ADD_NEW_PAYMENT_METHOD"];
  static String YES_DELETE = AppLocalizations.localedStrings["YES_DELETE"];
  static String TEMPLATES = AppLocalizations.localedStrings["TEMPLATES"];
  static String PAYMENT_METHODS_DELETE_BUTTON_CONTENT =
      AppLocalizations.localedStrings["PAYMENT_METHODS_DELETE_BUTTON_CONTENT"];
  static String WARNING = AppLocalizations.localedStrings["WARNING"];
  static String YES_I_AM_SURE =
      AppLocalizations.localedStrings["YES_I_AM_SURE"];
  static String ARE_YOU_SURE_DELETE_TEMPLATE =
      AppLocalizations.localedStrings["ARE_YOU_SURE_DELETE_TEMPLATE"];
  static String TEMPLATE_IS_DELETED =
      AppLocalizations.localedStrings["TEMPLATE_IS_DELETED"];
  static String TEMPLATE_IS_UPDATED =
      AppLocalizations.localedStrings["TEMPLATE_IS_UPDATED"];
  static String DELETE_TEMPLATE =
      AppLocalizations.localedStrings["DELETE_TEMPLATE"];
  static String CHOOSE_THE_CATEGORY =
      AppLocalizations.localedStrings["CHOOSE_THE_CATEGORY"];
  static String CHOOSE_COMMUNAL_TYPE =
      AppLocalizations.localedStrings["CHOOSE_COMMUNAL_TYPE"];
  static String OTHER = AppLocalizations.localedStrings["OTHER"];
  static String GAS = AppLocalizations.localedStrings["GAS"];
  static String LIGHT = AppLocalizations.localedStrings["LIGHT"];
  static String WATER = AppLocalizations.localedStrings["WATER"];
  static String PAY_WITH_TEMPLATE =
      AppLocalizations.localedStrings["PAY_WITH_TEMPLATE"];
  static String CONTINUE = AppLocalizations.localedStrings["CONTINUE"];
  static String CONTINUE_WITHOUT_TEMPLATE =
      AppLocalizations.localedStrings["CONTINUE_WITHOUT_TEMPLATE"];
  static String AMOUNT = AppLocalizations.localedStrings["AMOUNT"];
  static String SMART_CARD = AppLocalizations.localedStrings["SMART_CARD"];
  static String CHOOSE_OR_ADD_NEW =
      AppLocalizations.localedStrings["CHOOSE_OR_ADD_NEW"];
  static String CHOOSE_YOUR_SMART_CARD =
      AppLocalizations.localedStrings["CHOOSE_YOUR_SMART_CARD"];
  static String ENTER_PAYMENT_AMOUNT =
      AppLocalizations.localedStrings["ENTER_PAYMENT_AMOUNT"];
  static String TL = AppLocalizations.localedStrings["TL"];
  static String YOU_DONT_HAVE_TEMP =
      AppLocalizations.localedStrings["YOU_DONT_HAVE_TEMP"];
  static String CHOOSE_PAYMENT_METHOD =
      AppLocalizations.localedStrings["CHOOSE_PAYMENT_METHOD"];
  static String CHOOSE_CARD = AppLocalizations.localedStrings["CHOOSE_CARD"];
  static String ALL = AppLocalizations.localedStrings["ALL"];

  static String EXISTING_CARDS =
      AppLocalizations.localedStrings["EXISTING_CARDS"];
  static String DIGITS_NUMBER =
      AppLocalizations.localedStrings["DIGITS_NUMBER"];
  static String EXPIRATION_DATE =
      AppLocalizations.localedStrings["EXPIRATION_DATE"];
  static String CVV_CVC = AppLocalizations.localedStrings["CVV_CVC"];
  static String SAVE_THIS_PAYMENT_METHOD =
      AppLocalizations.localedStrings["SAVE_THIS_PAYMENT_METHOD"];
  static String CARD_NUMBER_SAMPLE =
      AppLocalizations.localedStrings["CARD_NUMBER_SAMPLE"];
  static String ADD = AppLocalizations.localedStrings["ADD"];
  static String STAR = AppLocalizations.localedStrings["STAR"];
  static String MM_YY = AppLocalizations.localedStrings["MM_YY"];
  static String CVV_CVC_TOOLKIT =
      AppLocalizations.localedStrings["CVV_CVC_TOOLKIT"];
  static String WHAT_IS_CVV_CODE =
      AppLocalizations.localedStrings["WHAT_IS_CVV_CODE"];
  static String CVV_CODE_IS = AppLocalizations.localedStrings["CVV_CODE_IS"];
  static String SCAN_THE_CARD =
      AppLocalizations.localedStrings["SCAN_THE_CARD"];
  static String SCAN_SCREEN_TEXT =
      AppLocalizations.localedStrings["SCAN_SCREEN_TEXT"];
  static String ADD_IMAGE = AppLocalizations.localedStrings["ADD_IMAGE"];
  static String CREATE_NEW = AppLocalizations.localedStrings["CREATE_NEW"];
  static String SHORT_CARD_NUMBER =
      AppLocalizations.localedStrings["SHORT_CARD_NUMBER"];
  static String CHOOSE_CURRENCY =
      AppLocalizations.localedStrings["CHOOSE_CURRENCY"];
  static String CURRENCY = AppLocalizations.localedStrings["CURRENCY"];
  static String FROM_TO = AppLocalizations.localedStrings["FROM_TO"];
  static String CHOOSE_DATE = AppLocalizations.localedStrings["CHOOSE_DATE"];
  static String FILTERS = AppLocalizations.localedStrings["FILTERS"];
  static String PAY_FROM_BALANCE =
      AppLocalizations.localedStrings["PAY_FROM_BALANCE"];
  static String IBAN = AppLocalizations.localedStrings["IBAN"];
  static String ENTER_IBAN = AppLocalizations.localedStrings["ENTER_IBAN"];
  static String YOUR_PAYMENT_WAS_SUCCESSFUL =
      AppLocalizations.localedStrings["YOUR_PAYMENT_WAS_SUCCESSFUL"];
  static String CATEGORY = AppLocalizations.localedStrings["CATEGORY"];
  static String PAYMENT_DATE = AppLocalizations.localedStrings["PAYMENT_DATE"];
  static String PAYMENT_DETAILS =
      AppLocalizations.localedStrings["PAYMENT_DETAILS"];
  static String WE_ARE_SAD = AppLocalizations.localedStrings["WE_ARE_SAD"];
  static String REGISTER_FAILED =
      AppLocalizations.localedStrings["REGISTER_FAILED"];
  static String CONNECTION_IS_LOW =
      AppLocalizations.localedStrings["CONNECTION_IS_LOW"];
  static String MISSING_INFORMATION =
      AppLocalizations.localedStrings["MISSING_INFORMATION"];
  static String EMPTY_FIELD = AppLocalizations.localedStrings["EMPTY_FIELD"];
  static String INSUFFICIENT_BALANCE =
      AppLocalizations.localedStrings["INSUFFICIENT_BALANCE"];
  static String INVALID_IBAN = AppLocalizations.localedStrings["INVALID_IBAN"];
  static String OK = AppLocalizations.localedStrings["OK"];
  static String TRY_AGAIN = AppLocalizations.localedStrings["TRY_AGAIN"];
  static String DOES_NOT_REGISTERED_USER =
      AppLocalizations.localedStrings["DOES_NOT_REGISTERED_USER"];
  static String UPDATE_FAILED =
      AppLocalizations.localedStrings["UPDATE_FAILED"];
  static String INVALID_PASSWORD =
      AppLocalizations.localedStrings["INVALID_PASSWORD"];
  static String SUCCESSFUL = AppLocalizations.localedStrings["SUCCESSFUL"];
  static String SELECT_BOTH_FROM_AND_TO_DATE = " DFGFS";
}
