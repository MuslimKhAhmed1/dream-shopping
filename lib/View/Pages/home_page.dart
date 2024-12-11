import 'package:carousel_slider/carousel_slider.dart';
import 'package:dream_shopping/View/Pages/Brands_page.dart';
import 'package:dream_shopping/View/Pages/detailBrand_page.dart';
import 'package:dream_shopping/View/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeProvider.isDarkMode ? Colors.black : Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner Section
            CarouselSlider(
              options: CarouselOptions(height: 200.0, autoPlay: true),
              items: [
                'assets/zer.png',
                'assets/sor.jpg',
                'assets/gusto.jpg',
              ].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    String name = "Brand name";
                    return GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailbrandPage(
                                brandName: name, brandlogo: "$i"),
                          )),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(i),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            // Brands Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Brands',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'See More',
                    style: TextStyle(fontSize: 16, color: Colors.red),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  brandCard('assets/gusto.jpg', 'Gusto'),
                  brandCard('assets/zer.png', 'ZER'),
                  brandCard('assets/sor.jpg', 'SOR'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Categories Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Categories',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BrandsPage(),
                        )),
                    child: const Text(
                      'See More',
                      style: TextStyle(fontSize: 16, color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // Categories Grid
            GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1,
              ),
              itemCount: 6, // Number of categories
              itemBuilder: (context, index) {
                return _categoryCard(
                  'assets/zer.png', // Replace with category image URL
                  [
                    'Groceries',
                    'Pickles',
                    'Rice',
                    'Snacks',
                    'Canned',
                    'Detergents'
                  ][index],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Brand Card Widget
  Widget brandCard(String imageUrl, String name) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 60,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imageUrl),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(height: 5),
        Text(name, style: const TextStyle(fontSize: 14)),
      ],
    );
  }

  // Category Card Widget
  Widget _categoryCard(String imageUrl, String title) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imageUrl, width: 50, height: 50),
          const SizedBox(height: 10),
          Text(title,
              style: const TextStyle(fontSize: 14, color: Colors.black)),
        ],
      ),
    );
  }
}
