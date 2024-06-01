import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

Widget buildAddToCartButton() {
  return SizedBox(
    width: double.infinity,
    child: FilledButton.icon(
      onPressed: () {},
      label: const Text('Add To Cart '),
      icon: const Icon(IconlyLight.bag2),
    ),
  );
}