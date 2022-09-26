import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../provider/order.dart';

class DataOrder extends StatefulWidget {
  final OrderItem orderItem;

  DataOrder(this.orderItem);

  @override
  State<DataOrder> createState() => _DataOrderState();
}

class _DataOrderState extends State<DataOrder> {
  var expanded = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            ListTile(
              leading: Text(
                "\$${widget.orderItem.amount!.toStringAsFixed(2)}",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                DateFormat(
                  'dd /MM /yyy  hh:mm',
                ).format(widget.orderItem.dateTime!),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: IconButton(
                icon: Icon(
                  expanded ? Icons.expand_less : Icons.expand_more,
                ),
                onPressed: () {
                  setState(() {
                    expanded = !expanded;
                  });
                },
              ),
            ),
            if (expanded)
              Container(
                  height:
                      min(widget.orderItem.products!.length * 20 + 100, 180),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                  child: ListView(
                    children: widget.orderItem.products!.map((prod) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              prod.title!,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "${prod.quantity} X ${prod.price!}",
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  )),
          ],
        ),
      ),
    );
  }
}
