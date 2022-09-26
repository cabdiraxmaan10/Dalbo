import 'package:flutter/material.dart';
import '../provider/order.dart';
import 'package:provider/provider.dart';
import '../widgets/order_item.dart';
import '../widgets/app-drawer.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = 'order_screen';

  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Order>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'OrderScreen',
          textAlign: TextAlign.center,
        ),
      ),
      drawer: MainDrawer(),
      body: ListView.builder(
          itemCount: orderData.orders.length,
          itemBuilder: (context, index) {
            return DataOrder(orderData.orders[index]);
          }),
    );
  }
}
