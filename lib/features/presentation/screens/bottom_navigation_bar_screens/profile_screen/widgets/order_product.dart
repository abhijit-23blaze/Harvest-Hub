import 'dart:math';
import 'package:flutter/material.dart';
import '../../../../../data/models/order.dart';
import '../../../../../data/models/product.dart';

class OrderProduct extends StatelessWidget {
  const OrderProduct({super.key, required this.order, required this.product});

  final Order order;
  final Product product;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 90,
          width: 90,
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                product.image,
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                product.name,
                style: textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                product.description,
                style: textTheme.bodySmall,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    'Rs.${product.price}',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  // Random().nextInt(4) +1 , (+1) => if the the random number = 0 , add 1
                  Text('Qty : ${Random().nextInt(4) + 1}')
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
