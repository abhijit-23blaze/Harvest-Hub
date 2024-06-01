import 'package:agriplant/core/utils/enums/order_status.dart';
import 'package:agriplant/features/presentation/screens/bottom_navigation_bar_screens/profile_screen/widgets/order_item.dart';
import 'package:flutter/material.dart';
import '../../../../../data/models/order.dart';
import '../widgets/order_information_card.dart';
import '../widgets/order_stepper.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({super.key, required this.order});

  final Order order;

  @override
  Widget build(BuildContext context) {
    const steps = OrderStatus.values;
    final activeStep = OrderStatus.values.indexOf(order.status);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Details '),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            OrderStepper(activeStep: activeStep, steps: steps),
            OrderInformationCard(
              order: order,
              steps: steps,
              activeStep: activeStep,
            ),
            OrderItem(order: order),
          ],
        ),
      ),
    );
  }
}
