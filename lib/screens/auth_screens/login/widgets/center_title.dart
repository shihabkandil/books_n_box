import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CenterTitle extends StatelessWidget {
  final String title;
  final EdgeInsetsGeometry? margin;
  const CenterTitle({required this.title, this.margin, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: GoogleFonts.robotoSlab(
            fontSize: 45, fontWeight: FontWeight.bold, color: Colors.black
            //fontStyle: FontStyle.italic
            ),
      ),
    );
  }
}
