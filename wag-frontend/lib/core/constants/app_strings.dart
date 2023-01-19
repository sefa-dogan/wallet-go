// ignore_for_file: constant_identifier_names

class AppStrings {
  static const String ADMIN_APP_ACCOUNT_ID =
      "96569452-a3ba-fa4e-8cea-3a0898688b95";
  static const String ADMIN_WALLET_ID = "96569452-a3ba-fa4e-8cea-3a0898688b94";

  static const String BASE_URL = "http://localhost:5000/";
  static const String APP_USERS_PATH = "api/app/app-user/";
  static const String IS_USER_REGISTERED_PATH =
      "api/app/app-user/is-registered/";
  static const String USERS_INFO_PATH = "api/app/user-info/";
  static const String WALLETS_PATH = "api/app/wallet/";
  static const String APP_ACCOUNTS_PATH = "api/app/app-account/";
  static const String GET_WALLET_ID_FROM_APP_ACCOUNT_PATH =
      "api/app/app-account/get-wallet-id/";
  static const String TRANSACTIONS_PATH = "api/app/transaction/";
  static const String GET_APP_USER_ID_PATH = "api/app/app-user/get-user-id/";
  static const String GET_USER_INFO_ID_PATH =
      "api/app/user-info/get-user-info-id/";
  static const String GET_USER_INFO_ID_FROM_WALLET_PATH =
      "api/app/wallet/get-user-info-id/";
  static const String GET_WALLET_ID_PATH = "api/app/wallet/get-wallet-id/";
  static const String GET_APP_ACCOUNTS_IDS_PATH =
      "api/app/app-account/get-accounts-id/";
  static const String GET_TRANSACTIONS_IDS_PATH =
      "api/app/transaction/get-transactions-id/";
  static const String GET_ALL_TRANSACTIONS_PATH =
      "api/app/transaction/get-all-transactions/";
  static const String GET_LAST_PAYMENTS_PATH =
      "api/app/transaction/get-last-payments/";

  static const String UPDATE_APP_ACCOUNT_BALANCE_PATH =
      "api/app/app-account/update-balance/";
  static const String UPDATE_APP_ACCOUNT_NAME_PATH =
      "api/app/app-account/update-name/";
  static const String UPDATE_WALLET_BALANCE_PATH =
      "api/app/wallet/update-balance/";

// http metotlarında data parametresinde kullanılır

  static const String id = "id";
  static const String appUserId = "appUserId";
  static const String name = "name";
  static const String surname = "surname";
  static const String tcno = "tcno";
  static const String email = "email";
// http metotlarında data parametresinde kullanılır

  static const String balance = "balance";

  static const String USER_PROFILE_PICTURE = "assets/user.png";
  static const String INTRO_SCREEN_IMAGE1_NAME = "assets/bg.png";
  static const String EXCLAMATION_ICON = "assets/exclamation_icon.png";
  static const String RECTANGLE = "assets/rectangle.png";
  static const String CARD_CVV = "assets/card.png";
  static const String SCAN_CARD_BACKGROUND = "assets/scan_card_background.jpg";
  static const String SUCCESS_PAYMENT = "assets/success.png";
  static const String CHECK = "assets/check.png";

  static const String APP_NAME = "Wallet Go";
  static const String MY_WALLET = "MyWallet";
  static const String MY_ACCOUNT = "MyAccount";
  static const String INTRO_SCREEN_TITLE1 =
      'Now payments are "Smarter" than you think';
  static const String ENTER_USERNAME_OR_E_MAIL =
      "Enter your username or email adress";
  static const String ENTER_E_MAIL = "Enter your email adress";
  static const String ENTER_USERNAME = "Enter your username";
  static const String ENTER_NAME = "Enter your name";
  static const String ENTER_SURNAME = "Enter your surname";
  static const String ENTER_PASSWORD = "set password";
  static const String ENTER_TC_NO = "Enter your tc no";
  static const String APP_BAR_TITLE = "Boilerplate";
  static const String LOGIN = "Log in";
  static const String SIGN_OUT = "Sign out";
  static const String REGISTER = "Sign up";
  static const String TC_NO = "TC No";
  static const String USERNAME = "Username";
  static const String NAME = "Name";
  static const String SURNAME = "Surname";
  static const String E_MAIL = "E-mail";
  static const String PASSWORD = "Password";
  static const String NAME_AND_SURNAME = "Name & surname";
  static const String USERNAME_OR_E_MAIL = "Username/E-mail";
  static const String CREATE_ACCOUNT = "Create account";
  static const String HAVE_ACCOUNT = "Already have an account?";
  static const String FORGOT_PASSWORD = "Forgot password?";
  static const String HAVE_NOT_ACCOUNT = "Don't you have an account?";
  static const String HOME = "Home";
  static const String PAYMENTS = "Payments";
  static const String TRANSACTIONS = "Transactions";
  static const String NOTIFICATIONS = "Notifications";
  static const String PROFILE = "Profile";
  static const String QUICK_ACTIONS = "Quick actions";
  static const String PAY_BILLS = "Pay bills";
  static const String INCREASE_BALANCE = "Increase balance";
  static const String PAYMENTS_TEMPLATE = "Payments template";
  static const String SMART_CARDS = "Smart cards";
  static const String SMART_CARDS_UPPERCASE = "SMART CARDS";
  static const String ADD_NEW_CARD = "Add new card";

  static const String LATEST_PAYMENTS = "Latest payments";
  static const String ERROR_MESSAGE_PASSWORD =
      "Password length should be less than 15";
  static const String ERROR_MESSAGE_USERNAME = "Please enter username";
  static const String ERROR_MESSAGE_NAME = "Please enter your name";
  static const String ERROR_MESSAGE_SURNAME = "Please enter your surname";
  static const String ERROR_MESSAGE_EMAIL = "Please enter your email";
  static const String ERROR_MESSAGE_TC_NO = "Please enter your tc id number";
  static const String ERROR_MESSAGE_NAME_SURNAME =
      "Please enter your name and surname";
  static const String ERROR_MESSAGE_PAYMENT_METHOD =
      "Please choose payment method";
  static const String ERROR_MESSAGE_SMART_CARD = "Please choose a card";
  static const String ERROR_MESSAGE_AMOUNT = "Please fill amount field";
  static const String ERROR_MESSAGE_IBAN = "Please fill IBAN field";
  static const String ERROR_MESSAGE_CURRENCY = "Please choose a currency";
  static const String ERROR_MESSAGE_SOMETHING_WENT_WRONG =
      "Something went wrong";
  static const String LOGIN_EXCEPTION = "Login process has failed";

  static const String REQUIRED_TC_ID =
      "Please enter your TC ID number as 11 digits.";
  static const String PERSONAL_DETAILS = "Personal details";
  static const String PAYMENT_METHODS = "Payment methods";
  static const String PAYMENT_METHOD = "Payment method";
  static const String LANGUAGE = "Language";
  static const String RESET_PASSWORD = "Reset password";
  static const String APPLY = "Apply";
  static const String PAY = "Pay";
  static const String ADD_NEW_PAYMENT_METHOD = "Add new payment method";
  static const String YES_DELETE = "Yes, delete";
  static const String TEMPLATES = "Templates";
  static const String PAYMENT_METHODS_DELETE_BUTTON_CONTENT =
      "It will be impossible to undo this action. Do you want to continue?";
  static const String WARNING = "Warning!";
  static const String YES_I_AM_SURE = "Yes, I am sure";
  static const String LIGHT_ALERT_DIALOG_CONTENT =
      "This transaction cannot be reversed. Are you sure you want to delete the template?";
  static const String DELETE_TEMPLATE = "Delete template";
  static const String CHOOSE_THE_CATEGORY = "Choose the category";
  static const String CHOOSE_COMMUNAL_TYPE = "Choose communal type";
  static const String OTHER = "Other";
  static const String GAS = "Gas";
  static const String LIGHT = "Light";
  static const String WATER = "Water";
  static const String PAY_WITH_TEMPLATE = "Pay with template";
  static const String CONTINUE = "Continue";
  static const String CONTINUE_WITHOUT_TEMPLATE = "Continue without template";
  static const String AMOUNT = "Amount";
  static const String SMART_CARD = "Smart card";
  static const String CHOOSE_OR_ADD_NEW = "Choose or add new";
  static const String CHOOSE_YOUR_SMART_CARD = "Choose your smart card";
  static const String ENTER_PAYMENT_AMOUNT = "Enter payment amount";
  static const String TL = "TL";
  static const String YOU_DONT_HAVE_TEMP = "You don't have any templates yet";
  static const String CHOOSE_PAYMENT_METHOD = "Choose payment method";
  static const String CHOOSE_CARD = "Choose card";
  static const String ALL = "ALL";

  static const String EXISTING_CARDS = "EXISTING CARDS";
  static const String DIGITS_NUMBER = "16 digits number";
  static const String EXPIRATION_DATE = "Expiration date";
  static const String CVV_CVC = "CVV / CVC";
  static const String SAVE_THIS_PAYMENT_METHOD = "Save this payment method";
  static const String CARD_NUMBER_SAMPLE = "1234 5678 9012 1234";
  static const String ADD = "Add";
  static const String STAR = "***";
  static const String MM_YY = "MM / YY";
  static const String CVV_CVC_TOOLKIT = "The code that behind of card";
  static const String WHAT_IS_CVV_CODE = "What is CVV/CVC code?";
  static const String CVV_CODE_IS =
      "The CVV/CVC code (Card Verification Value/Code) is located on the back of your credit/debit card on the right side of the white signature strip; it is always the last 3 digits in case of VISA and MasterCard.";
  static const String SCAN_THE_CARD = "Scan the card";
  static const String SCAN_SCREEN_TEXT =
      "Please your card inside the rectangle";
  static const String ADD_IMAGE = "Add image";
  static const String CREATE_NEW = "Create new";
  static const String SHORT_CARD_NUMBER = "A31DF353";
  static const String CHOOSE_CURRENCY = "Choose currency";
  static const String CURRENCY = "Currency";
  static const String FROM_TO = "From - to";
  static const String CHOOSE_DATE = "Choose date";
  static const String FILTERS = "Filters";
  static const String PAY_FROM_BALANCE = "Pay from balance";
  static const String IBAN = "Iban";
  static const String ENTER_IBAN = "Enter iban";
  static const String YOUR_PAYMENT_WAS_SUCCESSFUL =
      "Your payment was successful!";
  static const String CATEGORY = "CATEGORY";
  static const String PAYMENT_DATE = "PAYMENT DATE";
  static const String PAYMENT_DETAILS = "Payment details";
  static const String WE_ARE_SAD = "We are sad :(";
  static const String REGISTER_FAILED = "Register process has been failed. ";
  static const String CONNECTION_IS_LOW =
      "Your connection is may be low. Check the connection";
  static const String MISSING_INFORMATION =
      "Please be sure about filling all informations and then try again.";
  static const String EMPTY_FIELD =
      "Please be sure about filling all requirements";
  static const String INSUFFICIENT_BALANCE = "Your balance is insufficient";
  static const String INVALID_IBAN = "Invalid iban";
  static const String OK = "Ok";
  static const String TRY_AGAIN = "Try again";
  static const String SAD_FACE = "assets/sad_face.jpg";
  static const String DOES_NOT_REGISTERED_USER =
      "Didn't found user who has this username";
  static const String UPDATE_FAILED = "Informations could not updated";
  static const String INVALID_PASSWORD = "Invalid password";
  static const String SUCCESSFUL = "Successful";
}
