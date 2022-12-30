import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:readmore/readmore.dart';

class OverViewParagraph extends StatelessWidget {
  const OverViewParagraph({super.key});

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);

    return Container(
      margin: EdgeInsets.only(bottom: 30, left: 20, right: 20),
      alignment: Alignment.centerLeft,
      child: ReadMoreText(
        'A good book description is a detailed, descriptive copy that is good for public display, used for your book marketing, book discovery, and for sales purposes. It helps potential buyers find and understand your book. It',
        trimLines: 4,
        trimMode: TrimMode.Line,
        trimCollapsedText: localization!.showMore,
        trimExpandedText: localization.showLess,
        style: TextStyle(
            fontWeight: FontWeight.w400, fontSize: 18, color: Colors.grey),
        lessStyle: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Theme.of(context).primaryColor),
        moreStyle: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Theme.of(context).primaryColor),
      ),
    );
  }
}
