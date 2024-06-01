import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../../../data/models/product.dart';
import '../cart_screen.dart';

class CartItem extends StatefulWidget {
  CartItem({
    super.key,
    required this.product,
    required this.onDismissed,
  required this.onCountValueChanged,
  });

  Product product;
  final Function(int) onCountValueChanged;
  final Function(DismissDirection) onDismissed;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {


  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.product.id.toString()),
      direction: DismissDirection.endToStart,
      onDismissed: widget.onDismissed,
      confirmDismiss: (direction) async {
        final completer = Completer<bool>();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 2),
            content: const Text('Remove From Cart ?'),
            action: SnackBarAction(
              label: 'Keep',
              onPressed: () {
                completer.complete(false);
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
            ),
          ),
        );
        Timer(
          const Duration(seconds: 2),
          () {
            if (!completer.isCompleted) {
              completer.complete(true);
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            }
          },
        );
        return await completer.future;
      },
      background: buildDismissibleBackground(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: SizedBox(
          height: 130,
          child: Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
            elevation: 0.8,
            color: Colors.white,
            child: Row(
              children: [
                buildProductImage(),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildProductTitleInCart(context),
                      buildProductsDescriptionInCart(context),
                      const SizedBox(height: 10),
                      buildPriceAndAddProductsToCart(context)
                    ],
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildDismissibleBackground() {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(12.0)),
      child: const Icon(
        IconlyLight.delete,
        color: Colors.white,
      ),
    );
  }

  Widget buildPriceAndAddProductsToCart(BuildContext context) {
    return Row(
      children: [
        Text(
          "Rs.${widget.product.price * widget.product.count}",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
        const Spacer(),
        SizedBox(
          height: 30,
          child: ToggleButtons(
              onPressed: (index) {
                setState(() {
                  if (index == 0) {
                    if (widget.product.count > 0) {
                      setState(() {
                        widget.product.count--;
                      });
                    } else {
                      return;
                    }
                  } else if (index == 2) {
                    setState(() {
                      widget.product.count++;
                    });
                  }
                });
                widget.onCountValueChanged(widget.product.count);
              },
              borderRadius: BorderRadius.circular(100.0),
              constraints: const BoxConstraints(minWidth: 30, minHeight: 30),
              selectedColor: Theme.of(context).colorScheme.primary,
              isSelected: const [
                true,
                false,
                true
              ],
              children: [
                const Icon(Icons.remove),
                Text('${widget.product.count}'),
                const Icon(Icons.add),
              ]),
        ),
      ],
    );
  }

  Widget buildProductsDescriptionInCart(BuildContext context) {
    return Text(
      widget.product.description,
      style: Theme.of(context).textTheme.bodySmall,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }

  Widget buildProductTitleInCart(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        widget.product.name,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  Widget buildProductImage() {
    return Container(
      height: double.infinity,
      width: 90,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(widget.product.image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
