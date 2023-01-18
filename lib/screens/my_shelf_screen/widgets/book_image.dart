import 'package:flutter/material.dart';

class BookImage extends StatelessWidget {
  const BookImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: MediaQuery.of(context).size.width / 3.5,
      margin: EdgeInsets.only(left: 15, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white38,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/bilalprofile.jpg"),
        ),
      ),
    );
  }
}
