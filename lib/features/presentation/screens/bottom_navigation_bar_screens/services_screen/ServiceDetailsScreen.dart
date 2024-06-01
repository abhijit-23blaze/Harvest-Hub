import 'package:flutter/material.dart';
import '../../../widgets/cutom_app_bar.dart';
import 'services/featured_products_grid_view2.dart';
import 'services/featured_products2.dart';
import 'services/featured_products_grid_view1.dart';
import 'services/featured_products1.dart';
import 'services/featured_products_grid_view3.dart';
import 'services/featured_products3.dart';
import 'services/featured_products_grid_view4.dart';
import 'services/featured_products4.dart';
import 'services/featured_products_grid_view5.dart';
import 'services/featured_products5.dart';
import 'services/featured_products_grid_view6.dart';
import 'services/featured_products6.dart';

class ServiceDetailsScreen extends StatelessWidget {
  final String serviceName;

  const ServiceDetailsScreen({Key? key, required this.serviceName})
      : super(key: key);

  Widget _getFeaturedProductsWidget(String serviceName) {
    switch (serviceName) {
      case 'Machinery':
        return FeaturedProducts1();
      case 'Seeds':
        return FeaturedProducts2();
      case 'Seedlings':
        return FeaturedProducts3();
      case 'Veternerian':
        return FeaturedProducts4();
      case 'AI Crop disease solution':
        return FeaturedProducts5();
      case 'Hire Worker':
        return FeaturedProducts6();
    // Add more cases for other service names if needed
      default:
        return Container(); // Default case, can return any fallback widget
    }
  }

  Widget _getFeaturedProductGridViewWidget(String serviceName) {
    switch (serviceName) {
      case 'Machinery':
        return FeaturedProductGridView1();
      case 'Seeds':
        return FeaturedProductGridView2();
      case 'Seedlings':
        return FeaturedProductGridView3();
      case 'Veternerian':
        return FeaturedProductGridView4();
      case 'AI Crop disease solution':
        return FeaturedProductGridView5();
      case 'Hire Worker':
        return FeaturedProductGridView6();
    // Add more cases for other service names if needed
      default:
        return Container(); // Default case, can return any fallback widget
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: Padding(
        padding: EdgeInsets.only(left: 20.0, right: 20),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              _getFeaturedProductsWidget(serviceName),
              _getFeaturedProductGridViewWidget(serviceName),
            ],
          ),
        ),
      ),
    );
  }
}
