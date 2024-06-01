import 'package:flutter/material.dart';
import '../../../../../../core/utils/assets_data.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ConsultationCard2 extends StatelessWidget {
  const ConsultationCard2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: SizedBox(
        height: 200,
        width: double.infinity,
        child: Card(
          color: Colors.blue.shade100,
          shadowColor: Colors.green.shade50,
          elevation: 0.1,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 20, bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.weather,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Colors.green.shade700,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        ' 24 °C',
                        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                            color: Colors.white
                            ,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                       Text(
                         AppLocalizations.of(context)!.degree,
                         style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                             // color: Colors.yellowAccent.shade100 ,

                             fontWeight: FontWeight.bold
                         ),
                       ),
                      Text(
                        AppLocalizations.of(context)!.degree2,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          // color: Colors.yellowAccent.shade100 ,

                            fontWeight: FontWeight.bold
                        ),
                      ),
                      // FilledButton(
                      //   style: ElevatedButton.styleFrom(
                      //       padding: const EdgeInsets.symmetric(
                      //           horizontal: 12, vertical: 0),
                      //       foregroundColor: Colors.white,
                      //       backgroundColor: Colors.green,
                      //       shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(12.0))),
                      //   onPressed: () {},
                      //   child: Text(AppLocalizations.of(context)!.freeConsultation2,
                      //       style: TextStyle(
                      //         fontWeight: FontWeight.bold,
                      //       )),
                      // ),
                    ],
                  ),
                ),
              ),
              Image.asset(AssetsData.contactUs2 ,width: 140,)
            ],
          ),
        ),
      ),
    );
  }
}
