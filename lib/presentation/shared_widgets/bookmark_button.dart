import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/cubit/bookmarks_cubit/bookmarks_cubit.dart';

class BookmarkButton extends StatelessWidget {
  const BookmarkButton(
      {super.key,
      required this.bookId,
      required this.onChange});

  final String? bookId;
  final ValueChanged<bool> onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(top: 10),
      child: FittedBox(
        child: Container(
          height: 30,
          width: 40,
          decoration:
              BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          child: FittedBox(
            child: BlocBuilder<BookmarksCubit, BookmarksState>(
                builder: (context, state) {
              var isBookmarked = BlocProvider.of<BookmarksCubit>(context)
                  .IsBookBookmarked(bookId);
              if (isBookmarked) {
                return IconButton(
                  onPressed: ()=>onChange (false),
                  icon: Icon(Icons.favorite),
                  iconSize: 30,
                  color: Colors.red,
                );
              } else {
                return IconButton(
                  onPressed: ()=>onChange (true),
                  icon: Icon(Icons.favorite_border),
                  iconSize: 30,
                  color: Colors.red,
                );
              }
            }),
          ),
        ),
      ),
    );
  }
}
