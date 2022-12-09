import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BestSellersTitle extends StatelessWidget {
  const BestSellersTitle({super.key});

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);

    return Container(
      margin: EdgeInsets.only(top: 35, bottom: 15, left: 30,right: 30),
      alignment: localization!.localeName == 'ar'
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Text(
        localization.bestSellers,
        style: TextStyle(
            fontWeight: FontWeight.w400, fontSize: 23, color: Colors.white),
      ),
    );
  }
}
