import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../data/models/book_model/book.dart';

class BookCard extends StatelessWidget {
  BookCard({
    Key? key,
    this.book,
    this.imageUrl,
  }) : super(key: key);
  String? imageUrl;
  final Book? book;
  @override
  Widget build(BuildContext context) {
    if (book != null) {
      imageUrl = book!.volumeInfo?.imageLinks?.thumbnail;
    }
    return Container(
      width: 440 / MediaQuery.of(context).devicePixelRatio,
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      margin: EdgeInsets.all(8),
      child: InkWell(
        onTap: () => {context.go('/book_details')},
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: (imageUrl != null)
              ? CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: imageUrl!,
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(color: Theme.of(context).primaryColor),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error_outline_rounded),
                )
              : Center(
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor,
                    ),
                ),
              ),
        ),
      ),
    );
  }
}
