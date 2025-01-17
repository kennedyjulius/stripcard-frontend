import '/extensions/custom_extensions.dart';

class ApiEndpoint {
  static const String mainDomain = "https://stripcard.appdevs.net";
  static const String baseUrl = "$mainDomain/api";
  static String loginURL = '/user/login'.addBaseURl();
  static String registerURL = '/user/register'.addBaseURl();
  // Email Verification
  static String sendCodeURL = '/user/send-code'.addBaseURl();
  static String emailVerifyURL = '/user/email-verify'.addBaseURl();
  //Forget Password
  static String forgetPasswordURL = '/user/forget/password'.addBaseURl();
  static String forgetPasswordVerifyURL =
      '/user/forget/verify/code'.addBaseURl();
  static String resetPasswordURL = '/user/forget/reset/password'.addBaseURl();
  static String logoutURL = '/user/logout'.addBaseURl();
  //Profile
  static String profileInfoURL = '/user/profile'.addBaseURl();
  static String profileUpdateURL = '/user/profile/update'.addBaseURl();
  static String deleteAccountURL = '/user/delete/account'.addBaseURl();
  static String passwordUpdateURL = '/user/password/update'.addBaseURl();

  //Virtual Card
  static String myCardURL = '/user/my-card'.addBaseURl();
  static String cardDetailsURL = '/user/my-card/details?card_id='.addBaseURl();
  static String cardBlockURL = '/user/my-card/block'.addBaseURl();
  static String cardUnblockURL = '/user/my-card/unblock'.addBaseURl();
  static String buyCardURL = '/user/my-card/create'.addBaseURl();
  static String withdrawFromCardURL = '/user/my-card/withdraw'.addBaseURl();
  static String cardFundURL = '/user/my-card/fund'.addBaseURl();
  static String cardChargesURL = '/user/my-card/charges'.addBaseURl();

  //Transactions
  static String transactionsURL = '/user/transactions'.addBaseURl();
  static String cardTransactionsURL =
      '/user/my-card/transaction?card_id='.addBaseURl();

  //Dashboard
  static String dashboardURL = '/user/dashboard'.addBaseURl();

  // Add Money
  static String addMoneyInfoURL = '/user/add-money/information'.addBaseURl();
  static String addMoneySubmitURL = '/user/add-money/submit-data'.addBaseURl();
  static String addMoneyManualConfirmedURL =
      '/user/add-money/manual/payment/confirmed'.addBaseURl();

  // Stripe Payment Confirm
  static String StripeConfirmedURL =
      '/user/add-money/stripe/payment/confirm'.addBaseURl();

  // log out
  static String logOutURL = '/user/logout'.addBaseURl();

// useful links
  static String usefulLinks = '/useful-links'.addBaseURl();
  static String transactionLogURL = '/user/transactions'.addBaseURl();

  // App Settings URL
  static String appSettingsURL = '/app-settings'.addBaseURl();
  static String kycInfoURL = '/user/kyc/input-fields'.addBaseURl();
  static String submitKycURL = '/user/kyc/submit'.addBaseURl();

  ///  =>>>>>>>>>> stripe virtual card
  static String stripeCardInfoURL = '/user/my-card/stripe'.addBaseURl();
  static String stripeCardDetailsURL =
      '/user/my-card/stripe/details?card_id='.addBaseURl();
  static String stripeCardTransactionURL =
      '/user/my-card/stripe/transaction?card_id='.addBaseURl();
  static String stripeSensitiveURl =
      '/user/my-card/stripe/get/sensitive/data'.addBaseURl();
  static String stripeInactiveURl =
      '/user/my-card/stripe/inactive'.addBaseURl();
  static String stripeActiveURl = '/user/my-card/stripe/active'.addBaseURl();
  static String stripeBuyCardURl = '/user/my-card/stripe/create'.addBaseURl();

  ///  =>>>>>>>>>> sudo virtual card
  static String sudoCardInfoURL = '/user/my-card/sudo'.addBaseURl();
  static String sudoCardFundURL = '/user/my-card/sudo/fund'.addBaseURl();
  static String sudoCardDetailsURL =
      '/user/my-card/sudo/details?card_id='.addBaseURl();
  static String sudoCardBlockURL = '/user/my-card/sudo/block'.addBaseURl();
  static String sudoCardUnBlockURL = '/user/my-card/sudo/unblock'.addBaseURl();
  static String sudoCardMakeOrRemoveDefaultFundURL =
      '/user/my-card/sudo/make-remove/default'.addBaseURl();
  static String sudoCreateCardURL = '/user/my-card/sudo/create'.addBaseURl();
  static String sudoCardTransactionURL =
      '/user/my-card/transaction?card_id='.addBaseURl();
  static String sudoCardTransactionsURL =
      '/user/my-card/sudo/transaction?card_id='.addBaseURl();
  static String sudoCreateURl = '/user/my-card/sudo/create'.addBaseURl();
  static String sudoChargeURl = '/user/my-card/sudo/charges'.addBaseURl();

  ///>>>>>>>>>  transfer money
  static String transferCheckUserURl =
      '/user/transfer-money/exist'.addBaseURl();
  static String transferInfoURl = '/user/transfer-money/info'.addBaseURl();
  static String transferConfirmURl =
      '/user/transfer-money/confirmed'.addBaseURl();
  //>>>>>>> money out
  static String withdrawInfoURL = '/user/withdraw/info'.addBaseURl();
  static String withdrawInsertURL = '/user/withdraw/insert'.addBaseURl();
  static String withdrawConfirmURL =
      '/user/withdraw/manual/confirmed'.addBaseURl();

  // Languages
  static String languagesURL = '/app-settings/languages'.addBaseURl();

  /// Strowallet
  static String strowalletCardURL = '/user/strowallet-card'.addBaseURl();
  static String strowalletCardChargeURL =
      '/user/strowallet-card/charges'.addBaseURl();
  static String strowalletCardDetailsURL =
      '${baseUrl}/user/strowallet-card/details?card_id=';
  static String strowalletCardTransactionURL =
      '${baseUrl}/user/strowallet-card/transaction?card_id=';
  static String strowalletCardBLockURL =
      '/user/strowallet-card/block'.addBaseURl();
  static String strowalletCardUnBlockURL =
      '/user/strowallet-card/unblock'.addBaseURl();
  static String strowalletBuyCardURL =
      '/user/strowallet-card/create'.addBaseURl();
  static String strowalletCardFundURL =
      '/user/strowallet-card/fund'.addBaseURl();
  static String strowalletCardMakeOrRemoveDefaultFundURL =
      '/user/strowallet-card/make-remove/default'.addBaseURl();
  // Gift Card
  static String myGiftCardURL = '/user/gift-card'.addBaseURl();
  static String allGiftCardURL = '/user/gift-card/all'.addBaseURl();
  static String searchGiftCardURL =
      '/user/gift-card/search?country='.addBaseURl();
  static String giftCardDetailsURL =
      '/user/gift-card/details?product_id='.addBaseURl();
  static String giftCardOrderURL = '/user/gift-card/order'.addBaseURl();
}
