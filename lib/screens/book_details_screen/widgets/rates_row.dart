import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../data/models/google_books/google_book.dart';

class RatesRow extends StatelessWidget {
  final String? price;
  final num? rating;
  final num? ratingsCount;
  final num? pagecount;
  const RatesRow({super.key, this.rating, this.ratingsCount, this.pagecount,this.price});

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);

    return Container(
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      margin: EdgeInsets.only(bottom: 120 / MediaQuery.of(context).devicePixelRatio),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Text(
                    '${pagecount?? price}',
                    style: TextStyle(fontSize: 28, color: Colors.orangeAccent, fontFamily: 'Poppins', fontWeight: FontWeight.w500),
                  ),
                  Text(
                    pagecount==null?localization!.price:localization!.pages,
                    style: TextStyle(fontSize: 20, fontFamily: 'Poppins', fontWeight: FontWeight.w400, color: Theme.of(context).textTheme.bodyMedium?.color),
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
                color: Colors.orangeAccent,
              ),
              Text(
                rating == null ? localization.norating : '$rating/5',
                style: TextStyle(fontSize: 28, fontFamily: 'Poppins', fontWeight: FontWeight.w500, color: Theme.of(context).textTheme.bodyMedium?.color),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Text(
                    ratingsCount == null ? '0' : '$ratingsCount',
                    style: TextStyle(fontSize: 28, color: Colors.orangeAccent, fontFamily: 'Poppins', fontWeight: FontWeight.w500),
                  ),
                  Text(
                    localization.vote,
                    style: TextStyle(fontSize: 20, fontFamily: 'Poppins', fontWeight: FontWeight.w400, color: Theme.of(context).textTheme.bodyMedium?.color),
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
