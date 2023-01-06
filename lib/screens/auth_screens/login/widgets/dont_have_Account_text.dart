import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app_project/utils/screen_block_size.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({Key? key,required this.text,required this.screenBlockSize,required this.onTap}) : super(key: key);
  final String text;
  final ScreenBlockSize screenBlockSize;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(text,
        style: GoogleFonts.cairo(
            fontWeight: FontWeight.bold,
            color: Colors.grey,
            fontSize: screenBlockSize.verticalBlockSize * 1.6),
      ),
    );
  }
}
