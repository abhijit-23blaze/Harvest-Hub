import 'package:flutter/material.dart';

import '../../../../../data/models/product.dart';

class ProductPricePerUnit extends StatelessWidget {
  const ProductPricePerUnit({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Rs.${product.price}/',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.w600),
          ),
          TextSpan(
            text: product.unit,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
