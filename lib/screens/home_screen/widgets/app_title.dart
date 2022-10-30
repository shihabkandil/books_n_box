import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.only(top: 45,left: 35,bottom: 20),
      alignment: Alignment.centerLeft,
      child: Column(
      children: [
        Text("BooksNBox",style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
        fontSize: 30,
        color: Colors.white
      ),
  ),
        Text("Welcome *UserName*",style: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.grey,
      ),
  ),
        ],
      ),
      );
  }
}