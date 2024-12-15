import 'package:dream_shopping/View/Pages/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dream_shopping/View/Pages/cart_page.dart';
import 'package:dream_shopping/View/Pages/home_page.dart';
import 'package:dream_shopping/View/Pages/order_page.dart';
import 'package:dream_shopping/View/Pages/rewards_page.dart';
import 'package:dream_shopping/View/Pages/profile_page.dart';
import '../../Model/colors.dart';

// Global key to access _BottomNavState
final GlobalKey<_BottomNavState> bottomNavKey = GlobalKey();

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    OrderPage(),
    CartPage(),
    RewardsPage(),
  ];

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 230, 0),
        elevation: 0,
        title: const Text(
          'DreamShopping',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfilePage(),
              ),
            ),
            icon: const Icon(CupertinoIcons.person_alt_circle,
                color: Colors.black),
          ),
          const SizedBox(width: 10),
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginPage(),
              ),
            ),
            icon: const Icon(CupertinoIcons.bell, color: Colors.black),
          ),
          const SizedBox(width: 10),
          const Icon(Icons.wallet, color: Colors.black),
          const SizedBox(width: 10),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: onItemTapped,
        selectedItemColor: AppColors.GoldCol,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Order'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard), label: 'Rewards'),
        ],
      ),
    );
  }
}
