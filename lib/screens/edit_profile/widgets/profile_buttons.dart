import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileButtons extends StatelessWidget {
  const ProfileButtons({super.key});

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MaterialButton(
          padding: EdgeInsets.symmetric(horizontal: 50),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          onPressed: () {},
          child: Text(localization!.cancel,
              style: TextStyle(
                  fontSize: 14, letterSpacing: 2.2, color: Theme.of(context).textTheme.bodyMedium?.color)),
        ),
        MaterialButton(
          onPressed: () {},
          color: Theme.of(context).primaryColor,
          padding: EdgeInsets.symmetric(horizontal: 50),
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Text(
            localization.save,
            style: TextStyle(
                fontSize: 14, letterSpacing: 2.2, color: Theme.of(context).textTheme.bodyMedium?.color),
          ),
        )
      ],
    );
  }
}
