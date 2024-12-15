import 'dart:ui';

import 'package:flutter/foundation.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkMode = false;
  Locale locale = Locale('en'); // Default locale is English

  void toggleDarkMode() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }

  void setLocale(Locale newLocale) {
    locale = newLocale;
    notifyListeners();
  }
}
