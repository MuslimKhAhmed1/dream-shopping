import 'package:dream_shopping/Model/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dream_shopping/Controller/themeProvider.dart';

class RewardHistory extends StatelessWidget {
  const RewardHistory({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeProvider.isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.GoldCol,
        centerTitle: true,
        title: const Text("Reward History"),
      ),
      body: const Center(
        child: Text("You have not get any reward"),
      ),
    );
  }
}
