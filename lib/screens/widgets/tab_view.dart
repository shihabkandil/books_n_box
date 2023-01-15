import 'package:flutter/material.dart';
import 'book_card.dart';

class BooksTab extends StatelessWidget {
  final List books;
  BooksTab({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: 
      (books.isNotEmpty)? 
      ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return BookCard(book: books[index],hasBookmarkButton: true,);
        },
      ): Center(child: Text("There is no Books !!"))
    );
  }
}
