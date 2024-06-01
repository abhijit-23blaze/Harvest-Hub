import 'package:agriplant/features/data/models/product.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'methods/build_add_to_cart_button.dart';
import 'methods/build_related_products_list.dart';
import 'widgets/circle_icon.dart';
import 'widgets/product_banner.dart';
import 'widgets/product_price_per_unit.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.product});

  final Product product;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int countValue = 0;
  bool showMore = false;
  TapGestureRecognizer readMoreOrLessGestureRecognizer = TapGestureRecognizer();

  @override
  void initState() {
    readMoreOrLessGestureRecognizer.onTap = () {
      setState(() {
        showMore = !showMore;
      });
    };
    super.initState();
  }

  @override
  void dispose() {
    readMoreOrLessGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: productDetailsAppBar(context),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductBanner(product: widget.product),
              buildProductTitle(context),
              checkAvailabilityOfProduct(context),
              buildProductRating(),
              buildAddAndRemoveProduct(context),
              buildTitle(context, title: 'Description'),
              buildDescriptionText(context),
              buildTitle(context, title: 'Related Products'),
              buildRelatedProductsList(),
              const SizedBox(height: 20),
              buildAddToCartButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDescriptionText(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
          TextSpan(
              text: showMore
                  ? widget.product.description
                  : "${widget.product.description.substring(0, widget.product.description.length - 100)} ...",
              style: Theme.of(context).textTheme.bodyMedium),
          TextSpan(
              recognizer: readMoreOrLessGestureRecognizer,
              text: showMore ? ' Read Less' : ' Read More',
              style: TextStyle(color: Theme.of(context).colorScheme.primary))
        ]));
  }

  Widget buildTitle(BuildContext context, {required String title}) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  AppBar productDetailsAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios_new),
      ),
      leadingWidth: 20,
      title: const Text('Details'),
      centerTitle: true,
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(IconlyLight.bookmark)),
        const SizedBox(width: 10),
      ],
    );
  }

  Widget buildProductTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Text(
        widget.product.name,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildAddAndRemoveProduct(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CircleIcon(
            icon: Icons.remove,
            onPressed: () {
              setState(() {
                countValue > 0 ? countValue-- : countValue;
              });
            }),
        Text(
          '   ${countValue} Pcs   ',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        CircleIcon(
            icon: Icons.add,
            onPressed: () {
              setState(() {
                countValue++;
              });
            }),
      ],
    );
  }

  Widget buildProductRating() {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Row(
        children: [
          Icon(
            Icons.star,
            color: Colors.yellow.shade700,
          ),
          Text('${widget.product.rating} (192)'),
        ],
      ),
    );
  }

  Widget checkAvailabilityOfProduct(BuildContext context) {
    return Row(
      children: [
        Text(
          'Available in stock',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Colors.green.shade800, fontWeight: FontWeight.w600),
        ),
        const Spacer(),
        ProductPricePerUnit(product: widget.product),
      ],
    );
  }
}