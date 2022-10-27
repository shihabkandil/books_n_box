import 'package:flutter/material.dart';

class CenterLogo extends StatelessWidget {
  const CenterLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/Logo_Blue.png',
          width: 336,
        ),
      ],
    );
  }
}
