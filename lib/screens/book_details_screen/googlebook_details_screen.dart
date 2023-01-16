import 'package:flutter/material.dart';
import 'package:mobile_app_project/data/models/google_books/google_book.dart';
import 'package:mobile_app_project/screens/book_details_screen/widgets/overview_header.dart';
import 'package:mobile_app_project/screens/book_details_screen/widgets/overview_paragraph.dart';
import 'package:mobile_app_project/screens/book_details_screen/widgets/rates_row.dart';
import 'widgets/screen_bar.dart';

class GoogleBookDetailsScreen extends StatelessWidget {
   GoogleBook? googleBook;
   Map<String, dynamic> allBook;
   GoogleBookDetailsScreen({Key? key, this.googleBook,required this.allBook}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    googleBook= allBook['GoogleBooks'];
    final String? bookName = googleBook!.volumeInfo!.title;
    final String authors = (googleBook!.volumeInfo!.authors).toString();
    final String? imageUrl = googleBook!.volumeInfo?.imageLinks?.thumbnail;
    final num? rating = googleBook!.volumeInfo!.averageRating;
    final num? ratingsCount = googleBook!.volumeInfo!.ratingsCount;
    final num? pagecount = googleBook!.volumeInfo!.pageCount;
    final String? bookDescription = googleBook!.volumeInfo!.description;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: CustomScrollView(
        slivers: [
          ScreenBar(
            bookName: bookName,
            imageUrl: imageUrl,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                RatesRow(rating: rating, ratingsCount: ratingsCount, pagecount: pagecount),
                OverViewHeader(authors: authors),
                OverViewParagraph(bookDescription: bookDescription),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
