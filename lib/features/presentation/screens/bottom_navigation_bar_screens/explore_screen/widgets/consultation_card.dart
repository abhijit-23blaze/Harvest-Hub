import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../../core/utils/assets_data.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ConsultationCard extends StatelessWidget {
  ConsultationCard({
    super.key,
  });

  Uri dialnumber = Uri(scheme: 'tel' , path: '62619795658');

  callnumber () async{
    await launchUrl(dialnumber);
  }

  // directcall()async{
  //   await FlutterPhoneDirect
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: SizedBox(
        height: 200,
        width: double.infinity,
        child: Card(
          color: Colors.green.shade50,
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
                        AppLocalizations.of(context)!.freeConsultation,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Colors.green.shade700,
                            fontWeight: FontWeight.bold),
                      ),
                       Text(AppLocalizations.of(context)!.freeConsultation1,),
                      FilledButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 0),
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0))),
                        onPressed:callnumber,
                        child: Text(AppLocalizations.of(context)!.freeConsultation2,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              Image.asset(AssetsData.contactUs ,width: 140,)
            ],
          ),
        ),
      ),
    );
  }
}
