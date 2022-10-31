import 'package:flutter/material.dart';
import 'package:mobile_app_project/utils/screen_block_size.dart';

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
