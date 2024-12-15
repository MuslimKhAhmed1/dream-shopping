import 'package:dream_shopping/Model/Brands.dart';
import 'package:dream_shopping/Model/colors.dart';
import 'package:dream_shopping/View/Pages/detailBrand_page.dart';
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
        centerTitle: true,
        title: const Text(
          "Brandes",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColors.GoldCol,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 45,
                width: 310,
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
              IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 5 / 4, // Aspect ratio for grid tiles
              ),
              itemCount: brands.brand.length,
              itemBuilder: (context, index) {
                final entry = brands.brand[index].entries.first;
                final brandName = entry.key; // The brand name
                final brandImagePath = entry.value; // The image path

                return GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailbrandPage(
                              brandName: brandName, brandlogo: brandImagePath),
                        )),
                    child: Card(
                      elevation: 5,
                      child: Container(
                        // margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.background,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 100,
                              height: 80,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(brandImagePath),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(brandName,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
