import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app_project/utils/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  //const CustomTextField({Key? key}) : super(key: key);
  final String _label;
  final Icon _icon;
  final bool isHidden;

  const CustomTextField(this._label, this._icon, this.isHidden, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextField(
        obscureText: isHidden,
        controller: TextEditingController(text: ''),
        enabled: true,
        cursorColor: AppColors.primaryColor,
        decoration: InputDecoration(
          hintText: 'Enter ' + _label,
          suffixIcon: _icon,
          contentPadding: const EdgeInsetsDirectional.only(start: 25),
          focusedBorder: customInputBorder(Colors.black),
          errorBorder: customInputBorder(Colors.pinkAccent),
          labelText: _label,
          labelStyle: GoogleFonts.roboto(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(158, 0, 0, 0)),
          enabledBorder: customInputBorder(Colors.black),
        ),
      ),
    );
  }

  OutlineInputBorder customInputBorder(Color c) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      borderSide: BorderSide(width: 1, color: c),
    );
  }
}
