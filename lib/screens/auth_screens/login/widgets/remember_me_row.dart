import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app_project/utils/screen_block_size.dart';

class RememberMeRow extends StatelessWidget {
  const RememberMeRow({Key? key,required this.sizingConfig}) : super(key: key);
  final ScreenBlockSize sizingConfig;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(sizingConfig.horizontalBlockSize * 1.5)),
              visualDensity: VisualDensity.compact,
              onChanged: (value) => {},
              value: true,
            ),
            Text(
                "Remember me",
                style: TextStyle(fontSize: sizingConfig.verticalBlockSize * 2,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,)
            ),
          ],
        ),
        TextButton(
          onPressed: () => {},
          child: Text(
            'Forgot Password?',
            style: GoogleFonts.cairo(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
                fontSize: sizingConfig.verticalBlockSize * 1.6),
          ),
        ),
      ],
    );
  }
}
