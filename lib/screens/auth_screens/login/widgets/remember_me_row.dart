import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RememberMeRow extends StatelessWidget {
  const RememberMeRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Padding(padding: EdgeInsets.only(left: 25)),
        SizedBox(
          width: 190,
          child: CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            title: Transform.translate(
              offset: const Offset(-20, 0),
              child: Text(
                "Remember Me",
                style: GoogleFonts.cairo(
                    fontWeight: FontWeight.bold, color: Colors.black45),
              ),
            ),
            value: false,
            selected: false,
            onChanged: (value) => {},
          ),
        ),
        TextButton(
          onPressed: () => {},
          child: Text(
            "Forgot Password?",
            style: GoogleFonts.cairo(
                fontWeight: FontWeight.bold,
                color: Colors.black45,
                fontSize: 16),
          ),
        ),
      ],
    );
  }
}
