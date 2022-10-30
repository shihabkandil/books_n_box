import 'package:flutter/material.dart';

class SimilarBooksHeader extends StatelessWidget {
  const SimilarBooksHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 35, bottom: 15, left: 30),
      alignment: Alignment.centerLeft,
      child: Text(
        "Similar Books",
        style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            fontSize: 23,
            color: Colors.white),
      ),
    );
    ;
  }
}
