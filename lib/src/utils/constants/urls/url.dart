abstract class AppUrls {
  static const String baseURL = 'https://staging-api.mybiko.com';

  //auth repo
  static const String login = "/login";
  static const String loginSocial = "/login-social";
  static const String logout = "/logout";
  static const String register = "/register";
  static const String forgotPassword = "/forgot-password";

  //profile repo
  static const String getUser = "/user";
  static const String updateUser = "$getUser/update-profile";
  static const String changePassword = "/update-password";
  static const String favourites = "/favourites";
  static const String donations = "$getUser/donation-history";
  static const String singleDonationCase = "/cases";
  static const String verifyDonations =
      "$singleDonationCase/donate/verify-donation";
  static const String donate = "$singleDonationCase/donate";

  //facility repo
  static const String facility = "/facilities";
  static const String hospital = "/hospital";
  static const String hospitalPatients = "$hospital/cases";
  static const String patients = "$singleDonationCase/all";
}
