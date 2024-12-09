import 'package:dream_shopping/View/Pages/login_page.dart';
import 'package:dream_shopping/View/Pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:dream_shopping/View/Pages/bottom_nav.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../generated/l10n.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Fetch the current theme mode
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dream Shopping',
      theme: ThemeData.light(), // Light theme
      darkTheme: ThemeData.dark(), // Dark theme
      themeMode: themeProvider.isDarkMode
          ? ThemeMode.dark
          : ThemeMode.light, // Toggle theme
      // home: const BottomNav(),
      initialRoute: '/login',
      routes: {
        '/': (context) => BottomNav(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
        '/profile': (context) => LoginPage(),
      },
      supportedLocales: const [
        Locale('en', ''), // English
        Locale('ku', ''), // Kurdish (Iraqi)
        Locale('ar', ''), // Arabic
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        S.delegate, // Your generated localization file
      ],
      locale: themeProvider.locale, // The current locale
    );
  }
}

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
