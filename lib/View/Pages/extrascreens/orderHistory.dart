import 'package:dream_shopping/View/Pages/bottom_nav.dart';
import 'package:dream_shopping/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dream_shopping/Controller/themeProvider.dart';

class OrderdHistory extends StatelessWidget {
  const OrderdHistory({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeProvider.isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Orderd History"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("There is no order yet"),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                themeProvider.isDarkMode ? Colors.white : Colors.amber,
              )),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => BottomNav()),
                    (route) => false);
              },
              child: const Text("Order now"),
            ),
          ],
        ),
      ),
    );
  }
}
