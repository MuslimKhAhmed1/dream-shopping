import 'package:dream_shopping/Model/colors.dart';
import 'package:flutter/material.dart';

class CatigoryDetail extends StatelessWidget {
  const CatigoryDetail({super.key, required this.catigoryName});
  final String catigoryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          catigoryName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.GoldCol,
      ),
      body: Container(),
    );
  }
}
