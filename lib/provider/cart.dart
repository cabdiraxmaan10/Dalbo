import 'dart:math';

import 'package:flutter/cupertino.dart';

class CartItem {
  final String? productId;
  final String? title;
  final double? quantity;
  final double? price;
  CartItem({this.productId, this.title, this.quantity, this.price});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return _items;
  }

  int get itemCount {
    return _items == null ? 0 : _items.length;
  }

  // int get quantatiyLength {
  //   int quan = 0;
  //   _items.forEach((key, value) {
  //     quan += value.quantity!;
  //   });
  //   return quan;
  // }
  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, cardItem) {
      total += cardItem.price! * cardItem.quantity!;
    });
    return total;
  }

  void addItems(String productId, String title, double price) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (exisistingCardItem) => CartItem(
              productId: exisistingCardItem.productId!,
              title: exisistingCardItem.title!,
              price: exisistingCardItem.price!,
              quantity: exisistingCardItem.quantity! + 1));
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
          productId: DateTime.now().toString(),
          title: title,
          price: price,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
