import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/cart.dart' show Cart;

class CartItem extends StatelessWidget {
  final String? id;
  final String? productId;
  final String? title;
  final double? price;
  final double? quantity;
  const CartItem(
      {required this.id,
      required this.productId,
      required this.title,
      required this.price,
      required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      background: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        color: Theme.of(context).errorColor,
        padding: const EdgeInsets.only(right: 20),
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
      ),
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: Padding(
              padding: const EdgeInsets.all(5),
              child: CircleAvatar(
                child: FittedBox(
                    child: Text(
                  "\$$price",
                )),
              ),
            ),
            title: Text(title!),
            subtitle: Text(
              'Total:  \$${(price! * quantity!).toStringAsFixed(2)}',
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
            trailing: Text('${quantity!.toStringAsFixed(0)} X'),
          ),
        ),
      ),
    );
  }
}
