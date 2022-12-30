import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OverViewHeader extends StatelessWidget {
  const OverViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);

    return Container(
      margin: EdgeInsets.only(top: 35, bottom: 15, left: 30, right: 30),
      // alignment: Alignment.centerLeft,
      child: Text(
        localization!.overview,
        style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            fontSize: 23,
            color: Colors.white),
      ),
    );
  }
}
