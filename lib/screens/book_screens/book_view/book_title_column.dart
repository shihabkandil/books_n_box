import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app_project/data/book_data.dart';

class BookTitleColumn extends StatelessWidget {
  BookTitleColumn(this.book, {Key? key}) : super(key: key);

  BookData book;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 150),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //mainAxisSize: MainAxisSize.max,
        children: [
          Text(book.getBook().title!,
              style: GoogleFonts.robotoSlab(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w600)),
          SizedBox(
            height: 10,
          ),
          Text(
            'By ' + book.getAuthors(),
            style: GoogleFonts.ptSans(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.yellow,
                size: 26,
              ),
              SizedBox(
                width: 3,
              ),
              Text(
                '${book.getBook().avgRating}',
                style: GoogleFonts.ptSans(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                '(${book.getBook().ratingsCount})',
                style: GoogleFonts.ptSans(
                  color: Colors.white,
                  //fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
