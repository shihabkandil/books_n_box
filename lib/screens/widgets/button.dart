import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  final String text;
  final formKey;
  final void Function()? onPressed;

  const Button({required this.text, Key? key, this.onPressed, this.formKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(25.0),
        ),
        boxShadow: [
          BoxShadow(
              color: Color.fromARGB(48, 95, 92, 255),
              spreadRadius: 1,
              blurRadius: 8,
              offset: Offset(0, 3))
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: GoogleFonts.roboto(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(90))),
          fixedSize: const Size(250, 50),
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
