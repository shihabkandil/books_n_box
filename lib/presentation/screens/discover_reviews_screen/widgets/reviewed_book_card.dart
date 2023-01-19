import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app_project/data/models/google_books/google_book.dart';
import '../../../shared_widgets/header_text.dart';

class ReviewedBookCard extends StatelessWidget {
  const ReviewedBookCard({Key? key, required this.googleBook})
      : super(key: key);
  final GoogleBook googleBook;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      color: Colors.white54,
      borderRadius: BorderRadius.circular(30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: (googleBook.volumeInfo?.imageLinks?.thumbnail != null)
                ? CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl: googleBook.volumeInfo!.imageLinks!.thumbnail!,
                    placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(
                          color: Theme.of(context).primaryColor),
                    ),
                    errorWidget: (context, url, error) =>
                        Icon(Icons.error_outline_rounded),
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
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              children: [
                HeaderText(
                  text: googleBook.volumeInfo?.title ?? 'Not specified',
                ),
                SizedBox(
                  height: 10,
                ),
                HeaderText(
                  text: googleBook.volumeInfo!.description!.substring(0, 80) + '...',
                  color: Theme.of(context).textTheme.bodyMedium?.color,
                  fontSize: 14,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
