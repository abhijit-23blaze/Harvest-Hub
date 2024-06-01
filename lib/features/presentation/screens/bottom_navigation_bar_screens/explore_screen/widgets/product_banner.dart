import 'package:flutter/material.dart';

import '../../../../../data/models/product.dart';
class ProductBanner extends StatelessWidget {
  const ProductBanner({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: product.id,
      child: SizedBox(
        height: 230,
        width: double.infinity,
        child: Card(
          elevation: 12,
          clipBehavior: Clip.antiAlias,
          child: Image.asset(
            product.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}