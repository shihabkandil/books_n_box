import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CenterTitle extends StatelessWidget {
  final String _title;
  static const Padding _padding =
  Padding(padding: EdgeInsets.symmetric(vertical: 75));

  const CenterTitle(this._title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _padding,
        Text(
          _title,
          textAlign: TextAlign.center,
          style: GoogleFonts.robotoSlab(
            fontSize: 45,
            fontWeight: FontWeight.bold,
            //fontStyle: FontStyle.italic
          ),
        )
      ],
    );
  }
}
