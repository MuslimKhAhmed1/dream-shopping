// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  String get loginError => Intl.message(
        'Login failed. Please try again.',
        name: 'loginError',
        desc: '',
        args: [],
      );

  String get loginTitle => Intl.message(
        'login the page',
        name: 'login',
        desc: '',
        args: [],
      );
  String get signupTitle => Intl.message(
        'Sign Up',
        name: 'signupTitle',
        desc: '',
        args: [],
      );
  String get ok => Intl.message(
        'Sign Up',
        name: 'signupTitle',
        desc: '',
        args: [],
      );
  String get email => Intl.message(
        'Email',
        name: 'signupTitle',
        desc: '',
        args: [],
      );
  String get emailError => Intl.message(
        'Sign Up',
        name: 'signupTitle',
        desc: '',
        args: [],
      );
  String get password => Intl.message(
        'Password',
        name: 'signupTitle',
        desc: '',
        args: [],
      );
  String get passwordError => Intl.message(
        'Sign Up',
        name: 'signupTitle',
        desc: '',
        args: [],
      );
  String get loginButton => Intl.message(
        'Login',
        name: 'signupTitle',
        desc: '',
        args: [],
      );

  String get signupLink => Intl.message(
        'Login',
        name: 'signupTitle',
        desc: '',
        args: [],
      );
  String get loginLink => Intl.message(
        'Login',
        name: 'signupTitle',
        desc: '',
        args: [],
      );
  String get signupButton => Intl.message(
        'Login',
        name: 'signupTitle',
        desc: '',
        args: [],
      );
  String get signupSuccess => Intl.message(
        'Login',
        name: 'signupTitle',
        desc: '',
        args: [],
      );

  String get profileTitle => Intl.message(
        "Profile Title",
        name: "profileapp",
        desc: " ",
        args: [],
      );
  String get darkMode => Intl.message(
        "darkMode",
        name: "darkMode",
        desc: " ",
        args: [],
      );
  String get language => Intl.message(
        "language",
      );
  String get notifications => Intl.message(
        "notificatin",
      );
  String get supplierAccount => Intl.message(
        "supplier Account",
      );
  String get orderHistory => Intl.message("orderHistory");
  String get rewardsHistory => Intl.message("rewards History");
  String get logout => Intl.message("orderHistory");
  String get selectLanguage => Intl.message("orderHistory");
  String get forgotPassword => Intl.message("forget passsword? ");
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
