import 'package:flutter/material.dart';
import 'package:product_app_flutter/widgets/app-drawer.dart';

import '../widgets/products_grid.dart';
import '../provider/cart.dart';
import 'package:provider/provider.dart';
import '../widgets/203 badge.dart';
import './cart_screen.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductOverViewScreen extends StatefulWidget {
  ProductOverViewScreen({super.key});

  @override
  State<ProductOverViewScreen> createState() => _ProductOverViewScreenState();
}

class _ProductOverViewScreenState extends State<ProductOverViewScreen> {
  bool showFavoritesOnly = false;
  @override
  Widget build(BuildContext context) {
    // final productContainer =
    //     Provider.of<ProductProvider>(context, listen: false);
    // final cart = Provider.of<Cart>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'OverView Screen',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [
          PopupMenuButton(
              icon: Icon(Icons.more_vert),
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.Favorites) {
                    showFavoritesOnly = true;
                  } else {
                    showFavoritesOnly = false;
                  }
                });
              },
              itemBuilder: (_) => [
                    const PopupMenuItem(
                      child: Text('Only Favorites'),
                      value: FilterOptions.Favorites,
                    ),
                    const PopupMenuItem(
                      child: Text('Show All'),
                      value: FilterOptions.All,
                    ),
                  ]),
          Consumer<Cart>(
              child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.pushNamed(context, CartScreen.routeName);
                },
              ),
              builder: (_, cartData, child) {
                return Badge(
                  child: child,
                  value: cartData.itemCount.toString(),
                );
              }),
        ],
      ),
      drawer: MainDrawer(),
      body: ProductsGrid(showFavoritesOnly),
    );
  }
}
