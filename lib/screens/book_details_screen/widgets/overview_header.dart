import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OverViewHeader extends StatelessWidget {
  final String? authors;
  const OverViewHeader({super.key, this.authors});

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);

    return Container(
      margin: EdgeInsets.only(top: 35, bottom: 15, left: 30, right: 30),
      // alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    "${localization!.authors} :",
                    style: TextStyle(
                        fontFamily: 'Poppins', fontWeight: FontWeight.w500, fontSize: 23, color: Theme.of(context).primaryColor.withOpacity(1)),
                  ),
                  SizedBox(height: 20),
                  Text(
                    authors.toString(),
                    style: TextStyle(
                        fontFamily: 'Poppins', fontWeight: FontWeight.w500, fontSize: 23, color: Theme.of(context).textTheme.bodyMedium?.color),
                  ),
                  SizedBox(height: 50),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Text(
                localization.overview +' :',
                style:
                    TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w500, fontSize: 23, color: Theme.of(context).primaryColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
