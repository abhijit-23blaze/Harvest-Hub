import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../../data/services.dart';
import '../../../widgets/cutom_app_bar.dart';
import 'ServiceDetailsScreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';// Import the new screen

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        titleWidget:  Text(AppLocalizations.of(context)!.service),
      ),
      body: GridView.builder(
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            // Navigate to the service details screen when an image is tapped
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ServiceDetailsScreen(
                  serviceName: services[index].name,
                ),
              ),
            );
          },
          child: Container(
            alignment: Alignment.bottomCenter,
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  services[index].image,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.4),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      services[index].name,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        itemCount: services.length,
      ),
    );
  }
}
