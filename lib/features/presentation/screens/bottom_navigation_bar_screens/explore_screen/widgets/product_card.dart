import 'package:agriplant/features/data/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../product_details.dart';
import 'circle_icon.dart';
import 'product_price_per_unit.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0.1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: BorderSide(
          color: Colors.grey.shade400,
          width: 0.2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildProductBanner(context),
          buildProductTitle(context),
          buildProductCardInfo(context)
        ],
      ),
    );
  }

  Widget buildProductBanner(context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductDetails(
              product: product,
            ),
          ),
        );
      },
      child: Hero(
        tag: product.id,
        child: Container(
          alignment: Alignment.topRight,
          padding: const EdgeInsets.all(8.0),
          height: 130,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(product.image),
              fit: BoxFit.cover,
            ),
          ),
          child: SizedBox(
            width: 30,
            height: 30,
            child: IconButton.filledTonal(
              padding: EdgeInsets.zero,
              onPressed: () {},
              iconSize: 18,
              icon: const Icon(IconlyLight.bookmark),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildProductTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 8),
      child: Text(
        product.name,
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildProductCardInfo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
        children: [
          ProductPricePerUnit(product: product),
          const Spacer(),
          const CircleIcon(icon: Icons.add),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
