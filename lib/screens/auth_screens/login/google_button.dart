import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GoogleButton extends StatelessWidget {
  final String _text;

  const GoogleButton(this._text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(25.0),
        ),
        boxShadow: [
          BoxShadow(
              color: Color.fromARGB(50, 0, 0, 0),
              spreadRadius: 1,
              blurRadius: 8,
              offset: Offset(0, 3))
        ],
      ),
      child: ElevatedButton(
        onPressed: (() {}),
        child: Row(
          children: [
            Image.asset(
              'assets/Google_Logo.png',
              width: 30,
            ),
            const Padding(padding: EdgeInsets.only(right: 12)),
            Text(
              _text,
              textAlign: TextAlign.center,
              style: GoogleFonts.cabin(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ],
        ),
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(90))),
          fixedSize: const Size(250, 50),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
