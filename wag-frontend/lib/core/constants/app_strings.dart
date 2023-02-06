
// ignore_for_file: ant_identifier_names, non_constant_identifier_names

import 'package:flutter_boilerplate/localizations/app_localizations.dart';

class AppStrings {
  static String ADMIN_APP_ACCOUNT_ID = "96569452-a3ba-fa4e-8cea-3a0898688b95";
  static String ADMIN_WALLET_ID = "96569452-a3ba-fa4e-8cea-3a0898688b94";

  static String BASE_URL = "http://192.168.1.37:5000/";
  static String APP_USERS_PATH = "api/app/app-user/";
  static String IS_USER_REGISTERED_PATH = "api/app/app-user/is-registered/";
  static String USERS_INFO_PATH = "api/app/user-info/";
  static String WALLETS_PATH = "api/app/wallet/";
  static String APP_ACCOUNTS_PATH = "api/app/app-account/";
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

  static String balance =
      AppLocalizations.localedStrings["balance"]; //"balance";

  static String APP_NAME =
      AppLocalizations.localedStrings["APP_NAME"]; //"Wallet Go";
  static String MY_WALLET =
      AppLocalizations.localedStrings["MY_WALLET"]; //"MyWallet";
  static String MY_ACCOUNT =
      AppLocalizations.localedStrings["MY_ACCOUNT"]; // "MyAccount";
  static String INTRO_SCREEN_TITLE1 =
      AppLocalizations.localedStrings["INTRO_SCREEN_TITLE1"];
  //'Now payments are "Smarter" than you think';
  static String ENTER_USERNAME_OR_E_MAIL = AppLocalizations.localedStrings[
      "ENTER_USERNAME_OR_E_MAIL"]; //"Enter your username or email adress";

  static String ENTER_E_MAIL = AppLocalizations
      .localedStrings["ENTER_E_MAIL"]; // "Enter your email adress";
  static String ENTER_USERNAME = AppLocalizations
      .localedStrings["ENTER_USERNAME"]; // "Enter your username";
  static String ENTER_NAME =
      AppLocalizations.localedStrings["ENTER_NAME"]; // "Enter your name";
  static String ENTER_SURNAME =
      AppLocalizations.localedStrings["ENTER_SURNAME"]; // "Enter your surname";
  static String ENTER_PASSWORD =
      AppLocalizations.localedStrings["ENTER_PASSWORD"]; // "set password";
  static String ENTER_TC_NO =
      AppLocalizations.localedStrings["ENTER_TC_NO"]; //"Enter your tc no";
  // static  String APP_BAR_TITLE = "Boilerplate";
  static String LOGIN = AppLocalizations.localedStrings["LOGIN"]; //"Log in";
  static String SIGN_OUT =
      AppLocalizations.localedStrings["SIGN_OUT"]; //"Sign out";
  static String REGISTER =
      AppLocalizations.localedStrings["REGISTER"]; //"Sign up";
  static String TC_NO = AppLocalizations.localedStrings["TC_NO"]; //"TC No";
  static String USERNAME =
      AppLocalizations.localedStrings["USERNAME"]; // "Username";
  static String NAME = AppLocalizations.localedStrings["NAME"]; // "Name";
  static String SURNAME =
      AppLocalizations.localedStrings["SURNAME"]; // "Surname";
  static String E_MAIL = AppLocalizations.localedStrings["E_MAIL"]; // "E-mail";
  static String PASSWORD =
      AppLocalizations.localedStrings["PASSWORD"]; // "Password";
  static String NAME_AND_SURNAME =
      AppLocalizations.localedStrings["NAME_AND_SURNAME"]; // "Name & surname";
  static String USERNAME_OR_E_MAIL = AppLocalizations
      .localedStrings["USERNAME_OR_E_MAIL"]; // "Username/E-mail";
  static String CREATE_ACCOUNT =
      AppLocalizations.localedStrings["CREATE_ACCOUNT"]; // "Create account";
  static String HAVE_ACCOUNT = AppLocalizations
      .localedStrings["HAVE_ACCOUNT"]; // "Already have an account?";
  static String FORGOT_PASSWORD =
      AppLocalizations.localedStrings["FORGOT_PASSWORD"]; // "Forgot password?";
  static String HAVE_NOT_ACCOUNT = AppLocalizations
      .localedStrings["HAVE_NOT_ACCOUNT"]; // "Don't you have an account?";
  static String HOME = AppLocalizations.localedStrings["HOME"]; // "Home";
  static String PAYMENTS =
      AppLocalizations.localedStrings["PAYMENTS"]; // "Payments";
  static String TRANSACTIONS =
      AppLocalizations.localedStrings["TRANSACTIONS"]; //"Transactions";
  static String NOTIFICATIONS =
      AppLocalizations.localedStrings["NOTIFICATIONS"]; // "Notifications";
  static String PROFILE =
      AppLocalizations.localedStrings["PROFILE"]; // "Profile";
  static String QUICK_ACTIONS =
      AppLocalizations.localedStrings["QUICK_ACTIONS"]; // "Quick actions";
  static String PAY_BILLS =
      AppLocalizations.localedStrings["PAY_BILLS"]; // "Pay bills";
  static String INCREASE_BALANCE = AppLocalizations
      .localedStrings["INCREASE_BALANCE"]; // "Increase balance";
  static String PAYMENTS_TEMPLATE = AppLocalizations
      .localedStrings["PAYMENTS_TEMPLATE"]; // "Payments template";
  static String SMART_CARDS =
      AppLocalizations.localedStrings["SMART_CARDS"]; // "Smart cards";
  static String SMART_CARDS_UPPERCASE = AppLocalizations
      .localedStrings["SMART_CARDS_UPPERCASE"]; // "SMART CARDS";
  static String ADD_NEW_CARD =
      AppLocalizations.localedStrings["ADD_NEW_CARD"]; // "Add new card";

  static String LATEST_PAYMENTS =
      AppLocalizations.localedStrings["LATEST_PAYMENTS"]; // "Latest payments";
  static String ERROR_MESSAGE_PASSWORD = AppLocalizations.localedStrings[
      "ERROR_MESSAGE_PASSWORD"]; //"Password length should be less than 15";
  static String ERROR_MESSAGE_USERNAME = AppLocalizations
      .localedStrings["ERROR_MESSAGE_USERNAME"]; // "Please enter username";
  static String ERROR_MESSAGE_NAME = AppLocalizations
      .localedStrings["ERROR_MESSAGE_NAME"]; // "Please enter your name";
  static String ERROR_MESSAGE_SURNAME = AppLocalizations
      .localedStrings["ERROR_MESSAGE_SURNAME"]; //"Please enter your surname";
  static String ERROR_MESSAGE_EMAIL = AppLocalizations
      .localedStrings["ERROR_MESSAGE_EMAIL"]; //"Please enter your email";
  static String ERROR_MESSAGE_TC_NO = AppLocalizations.localedStrings[
      "ERROR_MESSAGE_TC_NO"]; //"Please enter your tc id number";
  static String ERROR_MESSAGE_NAME_SURNAME = AppLocalizations.localedStrings[
      "ERROR_MESSAGE_NAME_SURNAME"]; //"Please enter your name and surname";
  static String ERROR_MESSAGE_PAYMENT_METHOD = AppLocalizations.localedStrings[
      "ERROR_MESSAGE_PAYMENT_METHOD"]; //"Please choose payment method";
  static String ERROR_MESSAGE_SMART_CARD = AppLocalizations
      .localedStrings["ERROR_MESSAGE_SMART_CARD"]; //"Please choose a card";
  static String ERROR_MESSAGE_AMOUNT = AppLocalizations
      .localedStrings["ERROR_MESSAGE_AMOUNT"]; //"Please fill amount field";
  static String ERROR_MESSAGE_IBAN = AppLocalizations
      .localedStrings["ERROR_MESSAGE_IBAN"]; // "Please fill IBAN field";
  static String ERROR_MESSAGE_CURRENCY = AppLocalizations
      .localedStrings["ERROR_MESSAGE_CURRENCY"]; //"Please choose a currency";
  static String ERROR_MESSAGE_SOMETHING_WENT_WRONG =
      AppLocalizations.localedStrings[
          "ERROR_MESSAGE_SOMETHING_WENT_WRONG"]; //"Something went wrong";
  static String LOGIN_EXCEPTION = AppLocalizations
      .localedStrings["LOGIN_EXCEPTION"]; //"Login process has failed";
  static String VALIDATION_ERROR = AppLocalizations.localedStrings[
      "VALIDATION_ERROR"]; //"Please enter your Tc and E-mail as right format";
  static String REQUIRED_TC_ID = AppLocalizations.localedStrings[
      "REQUIRED_TC_ID"]; // "Please enter your TC ID as right format";
  static String PERSONAL_DETAILS = AppLocalizations
      .localedStrings["PERSONAL_DETAILS"]; // "Personal details";
  static String PAYMENT_METHODS =
      AppLocalizations.localedStrings["PAYMENT_METHODS"]; // "Payment methods";
  static String PAYMENT_METHOD =
      AppLocalizations.localedStrings["PAYMENT_METHOD"]; // "Payment method";
  static String LANGUAGE =
      AppLocalizations.localedStrings["LANGUAGE"]; //"Language";
  static String RESET_PASSWORD =
      AppLocalizations.localedStrings["RESET_PASSWORD"]; // "Reset password";
  static String APPLY = AppLocalizations.localedStrings["APPLY"]; //"Apply";
  static String PAY = AppLocalizations.localedStrings["PAY"]; // "Pay";
  static String ADD_NEW_PAYMENT_METHOD = AppLocalizations
      .localedStrings["ADD_NEW_PAYMENT_METHOD"]; // "Add new payment method";
  static String YES_DELETE =
      AppLocalizations.localedStrings["YES_DELETE"]; //"Yes, delete";
  static String TEMPLATES =
      AppLocalizations.localedStrings["TEMPLATES"]; // "Templates";
  static String PAYMENT_METHODS_DELETE_BUTTON_CONTENT = AppLocalizations
          .localedStrings[
      "PAYMENT_METHODS_DELETE_BUTTON_CONTENT"]; //"It will be impossible to undo this action. Do you want to continue?";
  static String WARNING =
      AppLocalizations.localedStrings["WARNING"]; // "Warning!";
  static String YES_I_AM_SURE =
      AppLocalizations.localedStrings["YES_I_AM_SURE"]; // "Yes, I am sure";
  static String LIGHT_ALERT_DIALOG_CONTENT = AppLocalizations.localedStrings[
      "LIGHT_ALERT_DIALOG_CONTENT"]; // "This transaction cannot be reversed. Are you sure you want to delete the template?";
  static String DELETE_TEMPLATE =
      AppLocalizations.localedStrings["DELETE_TEMPLATE"]; //"Delete template";
  static String CHOOSE_THE_CATEGORY = AppLocalizations
      .localedStrings["CHOOSE_THE_CATEGORY"]; //"Choose the category";
  static String CHOOSE_COMMUNAL_TYPE = AppLocalizations
      .localedStrings["CHOOSE_COMMUNAL_TYPE"]; // "Choose communal type";
  static String OTHER = AppLocalizations.localedStrings["OTHER"]; // "Other";
  static String GAS = AppLocalizations.localedStrings["GAS"]; // "Gas";
  static String LIGHT = AppLocalizations.localedStrings["LIGHT"]; //"Light";
  static String WATER = AppLocalizations.localedStrings["WATER"]; //"Water";
  static String PAY_WITH_TEMPLATE = AppLocalizations
      .localedStrings["PAY_WITH_TEMPLATE"]; // "Pay with template";
  static String CONTINUE =
      AppLocalizations.localedStrings["CONTINUE"]; //"Continue";
  static String CONTINUE_WITHOUT_TEMPLATE = AppLocalizations.localedStrings[
      "CONTINUE_WITHOUT_TEMPLATE"]; // "Continue without template";
  static String AMOUNT = AppLocalizations.localedStrings["AMOUNT"]; //"Amount";
  static String SMART_CARD =
      AppLocalizations.localedStrings["SMART_CARD"]; // "Smart card";
  static String CHOOSE_OR_ADD_NEW = AppLocalizations
      .localedStrings["CHOOSE_OR_ADD_NEW"]; //"Choose or add new";
  static String CHOOSE_YOUR_SMART_CARD = AppLocalizations
      .localedStrings["CHOOSE_YOUR_SMART_CARD"]; // "Choose your smart card";
  static String ENTER_PAYMENT_AMOUNT = AppLocalizations
      .localedStrings["ENTER_PAYMENT_AMOUNT"]; // "Enter payment amount";
  static String TL = AppLocalizations.localedStrings["TL"]; //"TL";
  static String YOU_DONT_HAVE_TEMP = AppLocalizations.localedStrings[
      "YOU_DONT_HAVE_TEMP"]; // "You don't have any templates yet";
  static String CHOOSE_PAYMENT_METHOD = AppLocalizations
      .localedStrings["CHOOSE_PAYMENT_METHOD"]; //"Choose payment method";
  static String CHOOSE_CARD =
      AppLocalizations.localedStrings["CHOOSE_CARD"]; // "Choose card";
  static String ALL = AppLocalizations.localedStrings["ALL"]; //"ALL";

  static String EXISTING_CARDS =
      AppLocalizations.localedStrings["EXISTING_CARDS"]; // "EXISTING CARDS";
  static String DIGITS_NUMBER =
      AppLocalizations.localedStrings["DIGITS_NUMBER"]; // "16 digits number";
  static String EXPIRATION_DATE =
      AppLocalizations.localedStrings["EXPIRATION_DATE"]; // "Expiration date";
  static String CVV_CVC =
      AppLocalizations.localedStrings["CVV_CVC"]; //"CVV / CVC";
  static String SAVE_THIS_PAYMENT_METHOD = AppLocalizations.localedStrings[
      "SAVE_THIS_PAYMENT_METHOD"]; // "Save this payment method";
  static String CARD_NUMBER_SAMPLE = AppLocalizations
      .localedStrings["CARD_NUMBER_SAMPLE"]; // "1234 5678 9012 1234";
  static String ADD = AppLocalizations.localedStrings["ADD"]; //"Add";
  static String STAR = AppLocalizations.localedStrings["STAR"]; // "***";
  static String MM_YY = AppLocalizations.localedStrings["MM_YY"]; // "MM / YY";
  static String CVV_CVC_TOOLKIT = AppLocalizations
      .localedStrings["CVV_CVC_TOOLKIT"]; // "The code that behind of card";
  static String WHAT_IS_CVV_CODE = AppLocalizations
      .localedStrings["WHAT_IS_CVV_CODE"]; // "What is CVV/CVC code?";
  static String CVV_CODE_IS = AppLocalizations.localedStrings[
      "CVV_CODE_IS"]; // "The CVV/CVC code (Card Verification Value/Code) is located on the back of your credit/debit card on the right side of the white signature strip; it is always the last 3 digits in case of VISA and MasterCard.";
  static String SCAN_THE_CARD =
      AppLocalizations.localedStrings["SCAN_THE_CARD"]; //"Scan the card";
  static String SCAN_SCREEN_TEXT = AppLocalizations.localedStrings[
      "SCAN_SCREEN_TEXT"]; // "Please be sure your card inside the rectangle";
  static String ADD_IMAGE =
      AppLocalizations.localedStrings["ADD_IMAGE"]; // "Add image";
  static String CREATE_NEW =
      AppLocalizations.localedStrings["CREATE_NEW"]; // "Create new";
  static String SHORT_CARD_NUMBER =
      AppLocalizations.localedStrings["SHORT_CARD_NUMBER"]; // "A31DF353";
  static String CHOOSE_CURRENCY =
      AppLocalizations.localedStrings["CHOOSE_CURRENCY"]; //"Choose currency";
  static String CURRENCY =
      AppLocalizations.localedStrings["CURRENCY"]; // "Currency";
  static String FROM_TO =
      AppLocalizations.localedStrings["FROM_TO"]; //"From - to";
  static String CHOOSE_DATE =
      AppLocalizations.localedStrings["CHOOSE_DATE"]; // "Choose date";
  static String FILTERS =
      AppLocalizations.localedStrings["FILTERS"]; // "Filters";
  static String PAY_FROM_BALANCE = AppLocalizations
      .localedStrings["PAY_FROM_BALANCE"]; // "Pay from balance";
  static String IBAN = AppLocalizations.localedStrings["IBAN"]; //"Iban";
  static String ENTER_IBAN =
      AppLocalizations.localedStrings["ENTER_IBAN"]; // "Enter iban";
  static String YOUR_PAYMENT_WAS_SUCCESSFUL = AppLocalizations.localedStrings[
      "YOUR_PAYMENT_WAS_SUCCESSFUL"]; // "Your payment was successful!";
  static String CATEGORY =
      AppLocalizations.localedStrings["CATEGORY"]; //"CATEGORY";
  static String PAYMENT_DATE =
      AppLocalizations.localedStrings["PAYMENT_DATE"]; // "PAYMENT DATE";
  static String PAYMENT_DETAILS =
      AppLocalizations.localedStrings["PAYMENT_DETAILS"]; // "Payment details";
  static String WE_ARE_SAD =
      AppLocalizations.localedStrings["WE_ARE_SAD"]; // "We are sad :(";
  static String REGISTER_FAILED = AppLocalizations.localedStrings[
      "REGISTER_FAILED"]; //"Register process has been failed. ";
  static String CONNECTION_IS_LOW = AppLocalizations.localedStrings[
      "CONNECTION_IS_LOW"]; // "Your connection is may be low. Check the connection";
  static String MISSING_INFORMATION = AppLocalizations.localedStrings[
      "MISSING_INFORMATION"]; // "Please be sure about filling all informations and then try again.";
  static String EMPTY_FIELD = AppLocalizations.localedStrings[
      "EMPTY_FIELD"]; // "Please be sure about filling all requirements";
  static String INSUFFICIENT_BALANCE = AppLocalizations.localedStrings[
      "INSUFFICIENT_BALANCE"]; // "Your balance is insufficient";
  static String INVALID_IBAN =
      AppLocalizations.localedStrings["INVALID_IBAN"]; // "Invalid iban";
  static String OK = AppLocalizations.localedStrings["OK"]; // "Ok";
  static String TRY_AGAIN =
      AppLocalizations.localedStrings["TRY_AGAIN"]; // "Try again";
  static String DOES_NOT_REGISTERED_USER = AppLocalizations.localedStrings[
      "DOES_NOT_REGISTERED_USER"]; // "Didn't found user who has this username";
  static String UPDATE_FAILED = AppLocalizations
      .localedStrings["UPDATE_FAILED"]; // "Informations could not updated";
  static String INVALID_PASSWORD = AppLocalizations
      .localedStrings["INVALID_PASSWORD"]; // "Invalid password";
  static String SUCCESSFUL =
      AppLocalizations.localedStrings["SUCCESSFUL"]; // "Successful";
}
