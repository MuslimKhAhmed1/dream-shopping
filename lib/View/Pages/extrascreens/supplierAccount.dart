import 'package:dream_shopping/Controller/themeProvider.dart';
import 'package:dream_shopping/Model/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SupplierAccount extends StatelessWidget {
  const SupplierAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeProvider.isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.GoldCol,
        centerTitle: true,
        title: const Text("Supplier Account"),
      ),
      body: const Center(
        child: Text("There is no Account"),
      ),
    );
  }
}
