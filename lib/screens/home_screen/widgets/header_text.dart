import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({super.key , required this.text});

    final String text;

  @override
  Widget build(BuildContext context) {

    return Container(
                child:  Text(text , style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold , fontSize: 20,fontFamily: 'Exo'),)
               );
  }
}