import 'package:flutter/material.dart';
import 'package:mobile_app_project/data/models/google_books/google_book.dart';
import 'package:mobile_app_project/data/models/nytimes_models/nytimes_best_sellers_models/nyt_best_sellers.dart';
import 'package:mobile_app_project/screens/book_details_screen/widgets/overview_header.dart';
import 'package:mobile_app_project/screens/book_details_screen/widgets/overview_paragraph.dart';
import 'package:mobile_app_project/screens/book_details_screen/widgets/rates_row.dart';
import 'widgets/screen_bar.dart';

class BestsellersDetailsScreen extends StatelessWidget {
   GoogleBook? googleBook;
   BestSellerBook? bestSellerBook;
   Map<String, dynamic> allBook;
   BestsellersDetailsScreen({Key? key, this.bestSellerBook,required this.allBook}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bestSellerBook= allBook['BestSellerBook'];
    final String? bookName = bestSellerBook!.title;
    final String? authors = bestSellerBook!.author;
    final String? imageUrl = bestSellerBook!.bookImage;
    final String? price = bestSellerBook!.price; 
    final String? bookDescription = bestSellerBook!.description;

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
                RatesRow(price: price),
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
