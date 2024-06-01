import 'package:flutter/material.dart';

import '../../../../../data/products.dart';
Widget buildRelatedProductsList() {
  return SizedBox(
    height: 100,
    child: ListView.separated(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => Container(
        height: 100,
        width: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              products[index].image,
            ),
          ),
        ),
      ),
      separatorBuilder: (context, index) => const SizedBox(width: 10),
      itemCount: products.length,
    ),
  );
}