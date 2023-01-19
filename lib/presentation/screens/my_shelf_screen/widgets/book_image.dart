import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app_project/data/models/google_books/google_book.dart';

class BookImage extends StatelessWidget {
  const BookImage({super.key, required this.thumbnailLink,required this.book});
  final String thumbnailLink;
  final GoogleBook book;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Container(
        height: 170,
        width: MediaQuery.of(context).size.width / 3.5,
        margin: EdgeInsets.only(left: 15, bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white38,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(thumbnailLink),
          ),
        ),
      ),
      onPressed: () => {context.go("/home/book_details", extra: {"GoogleBooks":book})},
    );
  }
}
