import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business_logic/cubit/localization_cubit/cubit/localization_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class DiscoverReviewsScreen extends StatelessWidget {
  const DiscoverReviewsScreen({super.key});
  @override
  Widget build(BuildContext context) {

    var localization = AppLocalizations.of(context);
    String lang = Localizations.localeOf(context).languageCode;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 45, left: 20, bottom: 20, right: 10),
          alignment: localization!.localeName == 'ar'
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    localization.latestrevs,
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 30,
                        color: Theme.of(context).textTheme.bodyMedium?.color),
                  ),
                  SizedBox(width: 70,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                    ),
                    onPressed: () {
                      BlocProvider.of<LocalizationCubit>(context).switchLanguage();
                    },
                    child: Text(
                      lang == 'en' ? 'Ar' : 'En',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),

              
            ],
          ),
        ),
      ),
    );
  }
}
