import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../business_logic/cubit/localization_cubit/cubit/localization_cubit.dart';

class LatestReviewsHeader extends StatelessWidget {
  const LatestReviewsHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);
    String lang = Localizations.localeOf(context).languageCode;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          localization!.latestrevs,
          style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: Theme.of(context).textTheme.bodyMedium?.color),
        ),
        SizedBox(width: 20,),
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
    );
  }
}
