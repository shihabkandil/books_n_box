import 'package:flutter/material.dart';
import 'package:mobile_app_project/data/models/google_books/google_book.dart';
import 'book_rating.dart';
import 'favourite_button.dart';

class SingleBookDetail extends StatelessWidget {
  const SingleBookDetail({
    super.key,required this.bookDetails
  });
  final GoogleBook bookDetails;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(right: 10),
        height: 170,
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
                bookDetails.volumeInfo!.title!.length>20?bookDetails.volumeInfo!.title!.substring(1,20)+'...':bookDetails.volumeInfo!.title!,
                style: TextStyle(fontSize: 15, color: Theme.of(context).backgroundColor, fontFamily: 'Poppins'),
              ),
              Text(
                bookDetails.volumeInfo!.authors.toString(),
                style: TextStyle(fontSize: 14, color: Theme.of(context).backgroundColor, fontFamily: 'Poppins'),
              ),
              SizedBox(height: 5),
              Text(
                bookDetails.volumeInfo!.description!.length>50?bookDetails.volumeInfo!.description!.substring(1,50)+'...':bookDetails.volumeInfo!.description!,
                style: TextStyle(fontSize: 12, color: Theme.of(context).backgroundColor),
              ),
              BookRating(),
              FavoriteButton(bookId: bookDetails.id),
            ],
          ),
        ),
      ),
    );
  }
}
