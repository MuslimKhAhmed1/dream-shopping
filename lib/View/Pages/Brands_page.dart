import 'package:dream_shopping/Model/Brands.dart';
import 'package:dream_shopping/View/Pages/home_page.dart';
import 'package:flutter/material.dart';

class BrandsPage extends StatelessWidget {
  BrandsPage({super.key});
  final HomePage homePage = HomePage();
  final Brands brands = Brands();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Brandes"),
        backgroundColor: const Color.fromARGB(255, 0, 123, 255),
      ),
      body: Column(
        children: [
          Container(
            height: 45,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1.5)),
                  hintText: "Search for brands"),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Number of columns
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 1, // Aspect ratio for grid tiles
              ),
              itemCount: brands.brand.length,
              itemBuilder: (context, index) {
                final entry = brands.brand[index].entries.first;
                final brandName = entry.key; // The brand name
                final brandImagePath = entry.value; // The image path

                return Container(
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: homePage.brandCard(brandImagePath, brandName));
              },
            ),
          ),
        ],
      ),
    );
  }
}
