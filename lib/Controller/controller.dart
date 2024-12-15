import 'package:flutter/foundation.dart';

class CounterProvider with ChangeNotifier {
  int _count = 0;
  List order = [];

  int get count => _count;

  void increment() {
    _count++;
    order.add(count);
    notifyListeners();
  }
}
