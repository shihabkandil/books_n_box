import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class AboutSection extends StatelessWidget {
  AboutSection(String this.description, {Key? key}) : super(key: key);

  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 219, 231, 255),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(35), topLeft: Radius.circular(35))),
      margin: EdgeInsets.only(top: 245),
      //color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: 25,
          ),
          Text(
            'About the Book',
            textAlign: TextAlign.center,
            style: GoogleFonts.robotoSlab(
                //color: Colors.white,
                decoration: TextDecoration.underline,
                fontSize: 22,
                fontWeight: FontWeight.w500),
          ),
          Center(
            heightFactor: 1.2,
            child: Container(
              constraints: BoxConstraints(maxWidth: 325),
              child: Text(
                description,
                textAlign: TextAlign.justify,
                style: GoogleFonts.rubik(
                    color: Colors.black38,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          SizedBox(
            height: 75,
          )
        ],
      ),
    );
  }
}
