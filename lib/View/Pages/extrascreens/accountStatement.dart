import 'package:dream_shopping/Controller/themeProvider.dart';
import 'package:dream_shopping/Model/colors.dart';
import 'package:dream_shopping/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Accountstatement extends StatelessWidget {
  const Accountstatement({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeProvider.isDarkMode
          ? Colors.black
          : const Color.fromARGB(255, 255, 251, 240),
      appBar: AppBar(
        backgroundColor: AppColors.GoldCol,
        centerTitle: true,
        title: const Text("Account Statement"),
      ),
      body: const Center(
        child: Text("Please login to view Account statement"),
      ),
    );
  }
}
