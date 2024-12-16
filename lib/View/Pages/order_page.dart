import 'package:dream_shopping/Controller/controller.dart';
import 'package:dream_shopping/Controller/themeProvider.dart';
import 'package:dream_shopping/Model/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterProvider = Provider.of<CounterProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeProvider.isDarkMode
          ? Colors.black
          : const Color.fromARGB(255, 255, 251, 235),
      body: counterProvider.orders.isEmpty
          ? const Center(child: Text("No orders yet!"))
          : Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  color: const Color.fromARGB(255, 255, 220, 23),
                  child: Text(
                    'Total Price: ( ${counterProvider.totalPrice} IQD )',
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: counterProvider.orders.length,
                    itemBuilder: (context, index) {
                      final order = counterProvider.orders[index];

                      return ListTile(
                        leading: Image.asset(order['image'], width: 50),
                        title: Text(
                          order['name'],
                          style: TextStyle(
                            color: themeProvider.isDarkMode
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        subtitle: Text(
                          'Quantity: ${order['quantity']} x Price: ${order['price']} = ${order['quantity'] * order['price']} IQD',
                          style: TextStyle(
                            color: themeProvider.isDarkMode
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.remove_circle,
                              color: Colors.red),
                          onPressed: () {
                            counterProvider.decreaseOrder(order['name']);
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
      bottomNavigationBar: counterProvider.orders.isEmpty
          ? const Center(child: Text("No orders yet!"))
          : Container(
              margin: EdgeInsets.all(10),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.GoldCol,
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const Text(
                "Order",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
    );
  }
}
