import 'package:flutter/material.dart';
import 'package:mobile_app_project/data/models/google_books/google_book.dart';
import 'book_card.dart';

class BooksTab extends StatelessWidget {
  List books;
  BooksTab({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return books.length > 0 ? BookCard(book: books[index]) : BookCard(book: null);
        },
      ),
    );
  }
}
