import 'package:flutter/foundation.dart';

import './proudct.dart';

class ProductProvider with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p1',
      title: 'strawberry ',
      description: 'Drink Strawberry and Enjoy Your time',
      price: 44.99,
      imageUrl:
          'https://images.pexels.com/photos/616840/pexels-photo-616840.jpeg?auto=compress&cs=tinysrgb&w=600',
    ),
    Product(
      id: 'p2',
      title: 'Water ',
      description: 'Drink water .',
      price: 10.99,
      imageUrl:
          'https://images.pexels.com/photos/416528/pexels-photo-416528.jpeg?auto=compress&cs=tinysrgb&w=600',
    ),
    Product(
      id: 'p3',
      title: 'Eat Fruit',
      description: 'Eating Fruit is Good for your Health.',
      price: 19.99,
      imageUrl:
          'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    ),
    Product(
      id: 'p4',
      title: 'Pizza ',
      description: 'The best PIZZA int the world and test and tell .',
      price: 100.99,
      imageUrl:
          'https://images.pexels.com/photos/315755/pexels-photo-315755.jpeg?auto=compress&cs=tinysrgb&w=600',
    ),
    Product(
      id: 'p5',
      title: 'Chicken and Rice',
      description: 'eat your meal with hight protien.',
      price: 49.99,
      imageUrl:
          'https://images.pexels.com/photos/1624487/pexels-photo-1624487.jpeg?auto=compress&cs=tinysrgb&w=600',
    ),
    Product(
      id: 'p6',
      title: 'Humburger',
      description: 'i khow you love humburger.',
      price: 49.99,
      imageUrl:
          'https://images.pexels.com/photos/750073/pexels-photo-750073.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    ),
    Product(
      id: 'p7',
      title: 'Fish ',
      description: 'Eating Fish is your good for your mind.',
      price: 200.99,
      imageUrl:
          'https://images.pexels.com/photos/699953/pexels-photo-699953.jpeg?auto=compress&cs=tinysrgb&w=600',
    ),
    Product(
      id: 'p8',
      title: 'Rice and Egg ',
      description: 'Eating Fish is your good for your mind.',
      price: 150.99,
      imageUrl:
          'https://images.pexels.com/photos/1410235/pexels-photo-1410235.jpeg?auto=compress&cs=tinysrgb&w=600',
    ),
    Product(
      id: 'p9',
      title: 'Drink WeterMALOOND ',
      description: 'Eating Fish is your good for your mind.',
      price: 150.99,
      imageUrl:
          'https://images.pexels.com/photos/1337825/pexels-photo-1337825.jpeg?auto=compress&cs=tinysrgb&w=600',
    ),
    Product(
      id: 'p10',
      title: ' Ice Cream   ',
      description: 'Ice cream  eat and drink.',
      price: 130.99,
      imageUrl:
          'https://images.pexels.com/photos/2638026/pexels-photo-2638026.jpeg?auto=compress&cs=tinysrgb&w=600',
    ),
  ];
  // bool _showFavoritesOnly = false;

  List<Product> get items {
    // if (_showFavoritesOnly) {
    //   return _items.where((productItem) => productItem.isFavorite).toList();
    // }
    return [..._items];
  }

  List<Product> get showFavorites {
    return _items.where((item) => item.isFavorite).toList();
  }

  // void favoritesOnly() {
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }

  Product findProductById(String id) {
    return items.firstWhere((productData) => productData.id == id);
  }

  void addProduct(Product data) {
    _items.add(data);
    notifyListeners();
  }
}
