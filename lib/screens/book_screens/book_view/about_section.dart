import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutSection extends StatelessWidget {
  AboutSection(String this.description, {Key? key}) : super(key: key);

  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(35), topLeft: Radius.circular(35))),
      margin: EdgeInsets.only(top: 245),
      //color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          Text(
            'About the Book',
            textAlign: TextAlign.center,
            style: GoogleFonts.robotoSlab(
                //color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: 325),
              child: Text(
                description + description,
                textAlign: TextAlign.justify,
                style: GoogleFonts.rubik(
                    color: Colors.black38,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }
}
