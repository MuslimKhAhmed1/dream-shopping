import 'package:dream_shopping/Controller/themeProvider.dart';
import 'package:dream_shopping/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeProvider.isDarkMode
          ? Colors.black
          : const Color.fromARGB(255, 255, 251, 240),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Notification"),
      ),
      body: const Center(
        child: Text("There is no Notification"),
      ),
    );
  }
}
