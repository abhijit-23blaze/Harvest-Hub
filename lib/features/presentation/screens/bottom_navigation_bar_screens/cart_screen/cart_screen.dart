import 'package:agriplant/features/data/products.dart';
import 'package:agriplant/features/presentation/screens/bottom_navigation_bar_screens/cart_screen/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../../../../data/cart.dart';
import '../../../widgets/cutom_app_bar.dart';

int countValue = 1;

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    //List<Product> cartItems = products.take(4).toList();
    // final totalPrice = cartItems.map((item) => item.price).reduce((acc, curr) => acc + curr);
    final totalPrice = cart
        .map((item) => item.price * item.count)
        .reduce((acc, curr) => acc + curr);

    return Scaffold(
     appBar: customAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          physics:const BouncingScrollPhysics(),
          child: Column(
            children: [
              if(cart.isNotEmpty)
              SizedBox(
                height: cart.length * 150,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return CartItem(
                      onCountValueChanged: (newCountValue) {
                        setState(() {
                          cart[index].count = newCountValue;
                        });
                      },
                      product: cart[index],
                      onDismissed: (direction) {
                        setState(() {
                          cart.removeAt(index);
                          products.removeAt(index);
                        });
                      },
                    );
                  },
                  itemCount: cart.length ,
                ),
              ),
              buildItemsCountAndPrice(cart, totalPrice, context),
              buildProceedButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildItemsCountAndPrice(
      List<dynamic> cartItems, totalPrice, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10).copyWith(top: 0),
      child: Row(
        children: [
          Text(
            'Total (${cartItems.length} items )',
          ),
          const Spacer(),
          Text('Rs.$totalPrice',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget buildProceedButton() {
    return SizedBox(
      width: double.infinity,
      child: FilledButton.icon(
        onPressed: () {},
        icon: const Icon(IconlyBold.arrowRight),
        label: const Text(
          'Proceed To Checkout',
        ),
      ),
    );
  }
}

