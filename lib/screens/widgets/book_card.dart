import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  const BookCard({Key? key, this.imageUrl,}) : super(key: key);
  final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 440 / MediaQuery.of(context).devicePixelRatio,
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        margin: EdgeInsets.all(8),
        child: InkWell(
          onTap: () => {}, //context.go('/home/book_details'),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: (imageUrl != null) ? CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: imageUrl ?? '',
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error_outline_rounded),
              ) : Icon(Icons.error_outline_rounded)
          ),
        ));
  }
}
