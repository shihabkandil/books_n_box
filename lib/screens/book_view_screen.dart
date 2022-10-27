import 'package:flutter/material.dart';
import 'package:mobile_app_project/data/models/book.dart';
import 'package:mobile_app_project/utils/app_theme.dart';
import 'package:mobile_app_project/utils/constants/app_colors.dart';
import '../data/book_data.dart';

class BookViewScreen extends StatelessWidget {
  BookViewScreen({Key? key}) : super(key: key);
  final BookData bookData = BookData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(248, 148, 144, 255),
      appBar: AppBar(
        elevation: 0.0,
        foregroundColor: Colors.white,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.bookmark))],
        backgroundColor: Colors.transparent,
        //title: Text(bookData.getBook().title!),
        leading: BackButton(
            //onPressed: () {},
            ),
      ),
      body: SafeArea(
        child: ListView(
          children: [Row()],
        ),
      ),
    );
  }
}
