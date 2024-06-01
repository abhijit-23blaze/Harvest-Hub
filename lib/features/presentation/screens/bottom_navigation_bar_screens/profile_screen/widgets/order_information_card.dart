import 'package:agriplant/core/utils/extensions/date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../../../../../../core/utils/enums/order_status.dart';
import '../../../../../data/models/order.dart';

class OrderInformationCard extends StatelessWidget {
  const OrderInformationCard({
    super.key,
    required this.order,
    required this.steps,
    required this.activeStep,
  });

  final Order order;
  final List<OrderStatus> steps;
  final int activeStep;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: .2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Order: ${order.id}',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Chip(
                    label: Text(steps[activeStep].name),
                    shape: const StadiumBorder(),
                    side: BorderSide.none,
                    avatar: const Icon(Icons.fire_truck),
                    backgroundColor:
                        Theme.of(context).colorScheme.primary.withOpacity(.4),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text('Delivery Date   '),
                  const Spacer(),
                  Text(
                    ' ${order.date.formatDate} ',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              buildClientInformation(context),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Text('Payment Method '),
                  Spacer(),
                  Text(
                    'Credit Card **1234',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildClientInformation(BuildContext context) {
    return Column(
      children: [
        Text(
          'Vanya Awasthi',
          style: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        const Row(
          children: [
            Icon(IconlyLight.home),
            SizedBox(width: 10),
            Expanded(
                child: Text(
                    'Vaidehi apartment, IIIT Sri city , Chittor , Andra-pradesh'))
          ],
        ),
        const SizedBox(height: 5),
        const Row(
          children: [
            Icon(IconlyLight.call),
            SizedBox(width: 10),
            Expanded(child: Text('9421345465')),
          ],
        ),
      ],
    );
  }
}
