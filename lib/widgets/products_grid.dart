import 'package:flutter/material.dart';
import 'package:product_app_flutter/provider/product_provider.dart';
import 'package:provider/provider.dart';
import './product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavorites;
  ProductsGrid(this.showFavorites);
  @override
  Widget build(BuildContext context) {
    final ProductProvider productData = Provider.of<ProductProvider>(context);
    final products =
        showFavorites ? productData.showFavorites : productData.items;
    return GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemBuilder: (context, index) {
          return ChangeNotifierProvider.value(
              value: products[index], child: ProductItem());
        });
  }
}
