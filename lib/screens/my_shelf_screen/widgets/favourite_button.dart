import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/cubit/bookmarks_cubit/bookmarks_cubit.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key, this.bookId});
  final bookId;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomRight,
        child: IconButton(
          onPressed: () {
            BlocProvider.of<BookmarksCubit>(context).deleteBookMark(bookId);
            BlocProvider.of<BookmarksCubit>(context).getAllBookmarkedBooks();
            print("I am so sorry Farah :( ......");
          },
          icon: Icon(Icons.favorite),
          iconSize: 24,
          color: Colors.red,
        ),
      ),
    );
  }
}
