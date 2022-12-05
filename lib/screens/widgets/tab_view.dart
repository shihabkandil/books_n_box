import 'package:flutter/material.dart';
import 'book_card.dart';

class BooksTab extends StatelessWidget {
  const BooksTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context,index){
            return BookCard();
          }
      ),
    );
  }
}