import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatefulWidget {
  final String _text;
  final _formKey;
  @override
  State<Button> createState() => _ButtonState();
  const Button(this._formKey, this._text, {Key? key}) : super(key: key);
}

class _ButtonState extends State<Button> {
  //const Button(this._text, {Key? key}) : super(key: key);

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
        onPressed: (() {
          if (widget._formKey.currentState.validate()) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Processing Data')));
          }
        }),
        child: Text(
          widget._text,
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
