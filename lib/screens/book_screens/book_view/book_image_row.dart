import 'package:flutter/material.dart';
import '../../../data/book_data.dart';
import '../book_view/book_title_column.dart';

class BookImageRow extends StatelessWidget {
  BookImageRow(this.book, {Key? key}) : super(key: key);
  //final BookData bookData = BookData();
  BookData book;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 200),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              book.getBook().imageLinks!['smallThumbnail']!,
              scale: 0.2,
            ),
          ),
          SizedBox(
            width: 25,
          ),
          BookTitleColumn(book),
        ],
      ),
    );
  }
}
