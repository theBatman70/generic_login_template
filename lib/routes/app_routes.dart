import 'package:flutter/material.dart';
import 'package:mynotes/presentation/adacana_screen/adacana_screen.dart';
import 'package:mynotes/presentation/login_or_signup_screen/login_or_signup_screen.dart';
import 'package:mynotes/presentation/signup_screen/signup_screen.dart';
import 'package:mynotes/presentation/login_screen/login_screen.dart';
import 'package:mynotes/presentation/forgot_password_screen/forgot_password_screen.dart';
import 'package:mynotes/presentation/settings_screen/settings_screen.dart';
import 'package:mynotes/presentation/language_screen/language_screen.dart';
import 'package:mynotes/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String adacanaScreen = '/adacana_screen';

  static const String loginOrSignupScreen = '/login_or_signup_screen';

  static const String signupScreen = '/signup_screen';

  static const String loginScreen = '/login_screen';

  static const String forgotPasswordScreen = '/forgot_password_screen';

  static const String settingsScreen = '/settings_screen';

  static const String languageScreen = '/language_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        adacanaScreen: AdacanaScreen.builder,
        loginOrSignupScreen: LoginOrSignupScreen.builder,
        signupScreen: SignupScreen.builder,
        loginScreen: LoginScreen.builder,
        forgotPasswordScreen: ForgotPasswordScreen.builder,
        settingsScreen: SettingsScreen.builder,
        languageScreen: LanguageScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: AdacanaScreen.builder
      };
}
