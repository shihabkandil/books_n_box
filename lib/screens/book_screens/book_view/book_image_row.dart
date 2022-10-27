import 'package:flutter/material.dart';
import '../book_view/book_title_column.dart';

class BookImageRow extends StatelessWidget {
  BookImageRow(String this.authors, this.image, this.title, {Key? key})
      : super(key: key);
  //final BookData bookData = BookData();
  final String authors;
  final String image;
  final String title;

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
              image,
              scale: 0.2,
            ),
          ),
          SizedBox(
            width: 25,
          ),
          BookTitleColumn(authors, title),
        ],
      ),
    );
  }
}
