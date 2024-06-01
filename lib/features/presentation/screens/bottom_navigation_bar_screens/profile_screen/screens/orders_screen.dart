import 'dart:math';
import 'package:agriplant/core/utils/enums/order_status.dart';
import 'package:agriplant/features/data/orders.dart';
import 'package:flutter/material.dart';

import '../widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final tabs = ["Processing", "Picking", "Shipping", "Delivered"];
    final tabs = OrderStatus.values.map((e) => e.name).toList();

    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My orders '),
          bottom: TabBar(
            isScrollable: true,
            tabs: List.generate(
              tabs.length,
              (index) => Tab(
                text: '${tabs[index]} ${Random().nextInt(10)}',
                // text: '${tabs[index]} ${orders[0].}',
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: List.generate(
            tabs.length,
            (index) {
              final filteredOrders = orders
                  .where(
                      (element) => element.status == OrderStatus.values[index])
                  .toList();
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return OrderItem(
                    order: filteredOrders[index],
                  );
                },
                itemCount: filteredOrders.length,
              );
            },
          ),
        ),
      ),
    );
  }
// AppBar ordersScreenAppBar()=>AppBar(
//   title: Text('My orders '),
//   bottom: TabBar(
//     tabs: [
//       Tab(icon: Icon(Icons.person), text: 'person',),
//       Tab(icon: Icon(Icons.person), text: 'person',),
//       Tab(icon: Icon(Icons.person), text: 'person',),
//       Tab(icon: Icon(Icons.person), text: 'person',),
//     ],
//   ),
// );
}
