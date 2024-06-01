import 'package:agriplant/features/presentation/screens/bottom_navigation_bar_screens/profile_screen/widgets/order_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../../../../../data/models/order.dart';
import '../screens/order_details_page.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.order});

  final Order order;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    double totalPrice = order.products.fold(0, (acc, e) => acc + e.price);
    final products = order.products.toList();
    // final products = products;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OrderDetailsPage(
              order: order,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 0.9,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      order.id,
                      style: theme.titleSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Text(' (${order.products.length} items )',
                        style: theme.bodySmall),
                    Text(
                      totalPrice.toStringAsFixed(2),
                      style: theme.bodySmall,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ...List.generate(
                  products.length,
                  (index) => OrderProduct(
                    order: order,
                    product: products[index],
                  ),
                ),
                if (order.products.length > 2)
                  TextButton.icon(
                      onPressed: () {
                        showModalBottomSheet(
                          elevation: .9,
                          showDragHandle: true,
                          isScrollControlled: true,
                          context: context,
                          builder: (context) => SizedBox(
                            height: MediaQuery.of(context).size.height / 2,
                            width: double.infinity,
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: OrderProduct(
                                    order: order,
                                    product: order.products[index],
                                  ),
                                );
                              },
                              itemCount: order.products.length,
                            ),
                          ),
                        );
                      },
                      icon: const Icon(IconlyBold.arrowRight),
                      label: const Text('View All'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
