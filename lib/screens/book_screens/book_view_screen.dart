import 'package:flutter/material.dart';
import '../../data/book_data.dart';
import 'book_view/book_image_row.dart';
import '../../screens/book_screens/book_view/about_section.dart';

class BookViewScreen extends StatelessWidget {
  BookViewScreen({Key? key}) : super(key: key);
  final BookData bookData = BookData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      //backgroundColor: Color.fromARGB(248, 148, 144, 255),
      appBar: AppBar(
        elevation: 0.0,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.bookmark),
            iconSize: 30,
          ),
          SizedBox(
            width: 10,
          )
        ],
        backgroundColor: Colors.transparent,
        //title: Text(bookData.getBook().title!),
        leading: BackButton(
            //onPressed: () {},
            ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color.fromARGB(249, 26, 19, 235),
          child: SafeArea(
            child: Stack(children: [
              BookImageRow(
                bookData.getAuthors(),
                bookData.getBook().imageLinks!['smallThumbnail']!,
                bookData.getBook().title!,
              ),
              AboutSection(bookData.getBook().description!),
            ]),
          ),
        ),
      ),
    );
  }
}
