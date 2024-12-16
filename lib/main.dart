import 'package:dream_shopping/Controller/controller.dart';
import 'package:dream_shopping/View/Pages/Brands_page.dart';
import 'package:dream_shopping/View/Pages/login_page.dart';
import 'package:dream_shopping/View/Pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:dream_shopping/View/Pages/bottom_nav.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:dream_shopping/Controller/themeProvider.dart';
import 'generated/l10n.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

      initialRoute: '/login',
      routes: {
        '/': (context) => BottomNav(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
        '/profile': (context) => LoginPage(),
        '/brands': (context) => BrandsPage(),
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
