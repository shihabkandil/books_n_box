import 'package:flutter/material.dart';
import 'package:mobile_app_project/screens/book_details_screen/widgets/overview_header.dart';
import 'package:mobile_app_project/screens/book_details_screen/widgets/overview_paragraph.dart';
import 'package:mobile_app_project/screens/book_details_screen/widgets/rates_row.dart';
import 'package:mobile_app_project/screens/book_details_screen/widgets/similar_books_carousel.dart';
import 'widgets/screen_bar.dart';
import 'widgets/similar_books_header.dart';

class BookDetailsScreen extends StatelessWidget {


  const BookDetailsScreen({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.black,
        body:CustomScrollView(
          slivers: [
        ScreenBar(),
            SliverList(delegate: SliverChildListDelegate(
              [
                RatesRow(),
                OverViewHeader(),
                OverViewParagraph(),
                SimilarBooksHeader(),
                SimilarBooksCarousel(),
              ]
            ),
            ),
      ],
    ),

    );
  }
}