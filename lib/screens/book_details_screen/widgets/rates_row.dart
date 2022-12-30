import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RatesRow extends StatelessWidget {
  const RatesRow({super.key});

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);

    return Container(
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      margin: EdgeInsets.only(
          bottom: 120 / MediaQuery.of(context).devicePixelRatio),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Text(
                    'xxxxx',
                    style: TextStyle(
                        fontSize: 28,
                        color: Colors.orangeAccent,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Readers',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          Column(
            children: [
              Icon(
                Icons.star,
                size: 55,
                color: Theme.of(context).primaryColor,
              ),
              Text(
                'x.x/10',
                style: TextStyle(
                    fontSize: 28,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Text(
                    'xx',
                    style: TextStyle(
                        fontSize: 28,
                        color: Colors.orangeAccent,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Votes',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
