import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app_project/screens/widgets/bookmark_button.dart';

import '../../business_logic/cubit/bookmarks_cubit/bookmarks_cubit.dart';
import '../../data/models/google_books/google_book.dart';

class BookCard extends StatelessWidget {
  

  BookCard({
    Key? key,
    this.book,
    this.imageUrl, required this.hasBookmarkButton,
  }) : super(key: key);

  String? imageUrl;
  final GoogleBook? book;
  final hasBookmarkButton;

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
        onTap: () => {context.go('/home/book_details')},
        child: Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.none,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: (imageUrl != null)
                  ? CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl: imageUrl!,
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
            if(hasBookmarkButton)
              Positioned(left: 63, bottom: -9, child: BookmarkButton(onPressed: ()=>BlocProvider.of<BookmarksCubit>(context).recordBookMark(book),bookId: book?.id,)),
          ],
        ),
      ),
    );
  }
}
