import 'package:flutter/material.dart';

class CenterLogo extends StatelessWidget {
  const CenterLogo({Key? key, required this.width}) : super(key: key);
  final double width;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/Logo_Blue.png',
      width: width,
    );
  }
}
