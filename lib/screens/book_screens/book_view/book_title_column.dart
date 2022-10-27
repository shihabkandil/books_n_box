import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookTitleColumn extends StatelessWidget {
  BookTitleColumn(String this.authors, this.title, {Key? key})
      : super(key: key);

  final String authors;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 150),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //mainAxisSize: MainAxisSize.max,
        children: [
          Text(title,
              style: GoogleFonts.robotoSlab(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w600)),
          SizedBox(
            height: 10,
          ),
          Text(
            'By ' + authors, //-----------
            style: GoogleFonts.ptSans(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
