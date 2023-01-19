import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  const HeaderText(
      {super.key,
      required this.text,
      this.color,
      this.fontWeight,
      this.fontSize});

  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color ?? Theme.of(context).primaryColor,
          fontWeight: fontWeight ?? FontWeight.bold,
          fontSize: fontSize ?? 20,
          fontFamily: 'Exo'),
    );
  }
}
