import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({super.key , required this.text});

    final String text;

  @override
  Widget build(BuildContext context) {

    return Text(
      text,
      style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold , fontSize: 20,fontFamily: 'Exo'),
    );
  }
}