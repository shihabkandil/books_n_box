import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../data/repository/user_data_cache.dart';

class AppTitle extends StatelessWidget {
  AppTitle({super.key});

  UserDataCache user = UserDataCache();

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);

    return Container(
      margin: EdgeInsets.only(top: 45, left: 35, bottom: 20, right: 20),
      alignment: localization!.localeName == 'ar'
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Column(
        children: [
          Text(
            "BooksNBox",
            style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 30,
                color: Theme.of(context).textTheme.bodyMedium?.color),
          ),
          Text(
            localization.welcome +" "+ user.readUserDataCachePreferences().name.toString(),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
