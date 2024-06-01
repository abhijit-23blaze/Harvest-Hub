import 'package:agriplant/features/data/products6.dart';
import 'package:flutter/material.dart';
import 'package:agriplant/features/presentation/screens/bottom_navigation_bar_screens/explore_screen/widgets/product_card.dart';

class FeaturedProductGridView6 extends StatelessWidget {
  const FeaturedProductGridView6({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: .66,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) => ProductCard(
        product: products[index],
      ),
      itemCount: products.length,
    );
  }
}
