import 'package:flutter/material.dart';
import 'package:mobile_app_project/utils/constants/app_colors.dart';
import '../../data/book_data.dart';
import 'book_view/book_image_row.dart';
import '../../screens/book_screens/book_view/about_section.dart';

class BookViewScreen extends StatelessWidget {
  BookViewScreen({Key? key}) : super(key: key);
  final BookData bookData = BookData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: true,
      backgroundColor: Color.fromARGB(255, 219, 231, 255),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () {},
        child: Icon(Icons.create),
      ),
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
      body: Container(
        color: Color.fromARGB(230, 20, 14, 187),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 0),
          child: SafeArea(
            bottom: false,
            child: Stack(children: [
              BookImageRow(bookData),
              AboutSection(bookData.getBook().description!),
            ]),
          ),
        ),
      ),
    );
  }
}
