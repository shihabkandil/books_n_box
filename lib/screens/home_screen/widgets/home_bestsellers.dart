import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeBestSellers extends StatelessWidget {
  const HomeBestSellers({super.key});

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);
    return Container(
      margin: EdgeInsets.only(top: 35, bottom: 15, left: 30),
      alignment: Alignment.centerLeft,
      child: Text(
        localization!.nowpopular,
        style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            fontSize: 23,
            color: Colors.white),
      ),
    );
  }
}
