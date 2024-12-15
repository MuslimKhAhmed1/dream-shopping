import 'package:dream_shopping/Model/Brands.dart';
import 'package:dream_shopping/Model/colors.dart';
import 'package:dream_shopping/View/Pages/home_page.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomePage homePage = HomePage();
    final Brands brands = Brands();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Categories",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.GoldCol,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        // physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1,
        ),
        itemCount: brands.catigory.length,
        itemBuilder: (context, index) {
          // return homePage.brandCard(
          //     "assets/flutterlogo.png", brands.catigory[index].toString());
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.pink[50],
            ),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Container(
                  width: 70,
                  height: 50,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage("assets/flutterlogo.png"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(height: 10),
                Text(brands.catigory[index].toString(),
                    style: const TextStyle(fontSize: 14)),
              ],
            ),
          );
        },
      ),
    );
  }
}
