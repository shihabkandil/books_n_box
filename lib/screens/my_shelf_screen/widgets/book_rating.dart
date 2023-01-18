import 'package:flutter/material.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "4/5",
          style: TextStyle(fontSize: 12, color: Colors.orangeAccent),
        ),
        Icon(
          Icons.star,
          size: 25,
          color: Colors.orangeAccent,
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
