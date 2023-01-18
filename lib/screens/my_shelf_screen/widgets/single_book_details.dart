import 'package:flutter/material.dart';
import 'book_rating.dart';
import 'favourite_button.dart';

class SingleBookDetail extends StatelessWidget {
  const SingleBookDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(right: 10),
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.7),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5),
              Text(
                "Book Name",
                style: TextStyle(fontSize: 15, color: Theme.of(context).backgroundColor, fontFamily: 'Poppins'),
              ),
              Text(
                "Author: JK.rowling",
                style: TextStyle(fontSize: 14, color: Theme.of(context).backgroundColor, fontFamily: 'Poppins'),
              ),
              SizedBox(height: 5),
              Text(
                "here we write the book desciptiondsadasdasdasdasdaaaaaaaaaaaaaaaaaaaaa",
                style: TextStyle(fontSize: 12, color: Theme.of(context).backgroundColor),
              ),
              BookRating(),
              FavoriteButton(),
            ],
          ),
        ),
      ),
    );
  }
}
