import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/enums/order_status.dart';

class OrderStepper extends StatelessWidget {
  const OrderStepper({
    super.key,
    required this.activeStep,
    required this.steps,
  });

  final int activeStep;
  final List<OrderStatus> steps;

  @override
  Widget build(BuildContext context) {
    return EasyStepper(
      activeStep: activeStep == steps.length - 1 ? activeStep + 1 : activeStep,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      stepRadius: 12,
      internalPadding: 0,
      activeStepTextColor: Colors.black87,
      finishedStepTextColor: Theme.of(context).colorScheme.primary,
      lineStyle: LineStyle(
        defaultLineColor: Colors.grey.shade300,
        finishedLineColor: Theme.of(context).colorScheme.primary,
        lineLength: MediaQuery.of(context).size.width * 0.7 / steps.length,
        lineType: LineType.normal,
        lineThickness: 2,
      ),
      steps: List.generate(steps.length, (index) {
        return EasyStep(
          finishIcon: const Icon(Icons.done),
          icon: const Icon(Icons.local_shipping),
          // customStep: CircleAvatar(
          //   radius: 8,
          //   backgroundColor: activeStep > index
          //       ? Theme.of(context).colorScheme.primary.withOpacity(0.5)
          //       : Colors.grey.shade400,
          //   child: CircleAvatar(
          //     radius: 2.5,
          //     backgroundColor: activeStep > index
          //         ? Theme.of(context).colorScheme.primary
          //         : Colors.grey.shade200,
          //
          //   ),
          // ),
          title: steps[index].name,
          topTitle: true,
        );
      }),
    );
  }
}
