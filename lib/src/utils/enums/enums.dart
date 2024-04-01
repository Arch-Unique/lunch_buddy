import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../utils_barrel.dart';

enum PasswordStrength {
  normal,
  weak,
  okay,
  strong,
}

enum FPL {
  email(TextInputType.emailAddress),
  number(TextInputType.number),
  text(TextInputType.text),
  password(TextInputType.visiblePassword),
  multi(TextInputType.multiline, maxLength: 1000, maxLines: 5),
  phone(TextInputType.phone),
  money(TextInputType.number),

  //card details
  cvv(TextInputType.number, maxLength: 4),
  cardNo(TextInputType.number, maxLength: 20),
  dateExpiry(TextInputType.datetime, maxLength: 5);

  final TextInputType textType;
  final int? maxLength, maxLines;

  const FPL(this.textType, {this.maxLength, this.maxLines = 1});
}

enum AuthMode {
  login("Log In", "Login with one following options", "Don't have an account? ",
      "Register here!", "Or Log in with"),
  register("Sign Up", "You can sign up with one following options",
      "Already have an account? ", "Login!", "Or sign up with");

  final String title, desc, after, afterAction, thirdparty;
  const AuthMode(
      this.title, this.desc, this.after, this.afterAction, this.thirdparty);
}

enum SuccessPagesMode {
  password("Password reset link sent",
      "Check your emails for the link sent to reset your Biko account password"),
  register("Confirm your account",
      "Check your emails for the link sent to confirm your Biko account");

  final String title, desc;
  const SuccessPagesMode(this.title, this.desc);
}

enum DashboardMode {
  home("Home", Assets.home2),
  facility("Facilities", Assets.chartOxy7),
  profile("Profile", Assets.profilehome);

  final String title, icon;
  const DashboardMode(this.title, this.icon);
}

enum ProfileActions {
  myprofile("My Profile", Assets.profile11),
  favourites("Favourites", Assets.star77),
  donation("Donations History", Assets.calendar63),
  settings("Settings", Assets.setting44),
  logout("Log Out", Assets.logout03);

  final String title, icon;
  const ProfileActions(this.title, this.icon);
}

enum SettingsAction {
  dynamicCard("Dynamic Card", Assets.dynamiccard),
  changePassword("Change Password", Assets.changepassword);

  final String title, icon;
  const SettingsAction(this.title, this.icon);
}

enum ErrorTypes {
  noInternet(Icons.wifi_tethering_off_rounded, "No Internet Connection",
      "Please check your internet connection and try again"),
  serverFailure(Icons.power_off_rounded, "Server Failure",
      "Something bad happened. Please try again later");

  final String title, desc;
  final dynamic icon;
  const ErrorTypes(this.icon, this.title, this.desc);
}
