import 'package:carousel_slider/carousel_slider.dart';
import 'package:dream_shopping/Model/Brands.dart';
import 'package:dream_shopping/Model/colors.dart';
import 'package:dream_shopping/View/Pages/Brands_page.dart';
import 'package:dream_shopping/View/Pages/CatigotyDetail.dart';
import 'package:dream_shopping/View/Pages/categories_page.dart';
import 'package:dream_shopping/View/Pages/detailBrand_page.dart';
import 'package:dream_shopping/Controller/themeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});
  // the brand card
  brandCard(String imageUrl, String name) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
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
        const SizedBox(height: 10),
        Text(name, style: const TextStyle(fontSize: 14)),
      ],
    );
  }

  final Brands brands = Brands();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Brands brands = Brands();
    final PageController _pageController = PageController();
    int activeIndex = 0;
    final CarouselSliderController _carouselController =
        CarouselSliderController();
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: themeProvider.isDarkMode
          ? Colors.black
          : const Color.fromARGB(255, 255, 251, 240),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              carouselController: _carouselController,
              options: CarouselOptions(
                height: 200.0,
                autoPlay: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    activeIndex = index; // Update the active index
                  });
                },
              ),
              items: brands.brand.map((brand) {
                // Extract brand name and logo
                final String brandName = brand.keys.first;
                final String brandLogo = brand.values.first;

                return Builder(
                  builder: (BuildContext context) {
                    return GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailbrandPage(
                              brandName: brandName, brandlogo: brandLogo),
                        ),
                      ),
                      child: Container(
                        width: 250,
                        height: 250,
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 5),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage(brandLogo),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 10),
            Center(
              child: SmoothPageIndicator(
                controller: _pageController,
                count: brands.brand.length,
                effect: const ExpandingDotsEffect(
                  dotHeight: 12,
                  dotWidth: 12,
                  activeDotColor: AppColors.GoldCol,
                ),
                onDotClicked: (index) {
                  setState(() {
                    activeIndex = index;
                    _pageController.animateToPage(index,
                        curve: Curves.linear,
                        duration: const Duration(seconds: 1));
                  });
                },
              ),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Brands',
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
                      )),
                ],
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 100,
              child: ListView.builder(
                itemCount: widget.brands.brand.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final entry = widget.brands.brand[index].entries.first;
                  final brandName = entry.key; // The brand name
                  final brandImagePath = entry.value; // The image path
                  return GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailbrandPage(
                            brandName: brandName,
                            brandlogo: brandImagePath,
                          ),
                        )),
                    child: widget.brandCard(brandImagePath, brandName),
                  );
                },
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
                            builder: (context) => const CategoriesPage(),
                          )),
                      child: const Text(
                        'See More',
                        style: TextStyle(fontSize: 16, color: Colors.red),
                      )),
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
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CatigoryDetail(
                        catigoryName: brands.catigory[index],
                      ),
                    ),
                  ),
                  child: _categoryCard(
                    'assets/zer.png', // Replace with category image URL
                    [
                      'Groceries',
                      'Pickles',
                      'Rice',
                      'Snacks',
                      'Canned',
                      'Detergents'
                    ][index],
                  ),
                );
              },
            ),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12),
              child: Text(
                "Most Point",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 250, // Specify a fixed height
              child: ListView.builder(
                itemCount: 8,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 10),
                    child: const Column(
                      children: [
                        CircleAvatar(
                            radius: 60,
                            backgroundImage: AssetImage("assets/sor.jpg")),
                        Text(
                          "Sor",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text("15000 = 1 point"),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Brand Card Widget

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
