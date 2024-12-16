import 'package:flutter/foundation.dart';

class CounterProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _orders = [];

  List<Map<String, dynamic>> get orders => _orders;

  // Add an item to the order
  void addOrder(String name, String image) {
    final existingIndex = _orders.indexWhere((item) => item['name'] == name);
    if (existingIndex != -1) {
      _orders[existingIndex]['quantity']++;
    } else {
      _orders.add({
        'name': name,
        'image': image,
        'quantity': 1,
        'price': 1000, // Fixed fake price
      });
    }
    notifyListeners();
  }

  // Decrease quantity or remove the item
  void decreaseOrder(String name) {
    final existingIndex = _orders.indexWhere((item) => item['name'] == name);
    if (existingIndex != -1) {
      if (_orders[existingIndex]['quantity'] > 1) {
        _orders[existingIndex]['quantity']--;
      } else {
        _orders.removeAt(existingIndex);
      }
      notifyListeners();
    }
  }

  // Total quantity of all items
  int get totalQuantity =>
      _orders.fold(0, (sum, item) => sum + (item['quantity'] as int));

  // Total price
  double get totalPrice =>
      _orders.fold(0, (sum, item) => sum + (item['quantity'] * item['price']));
}
