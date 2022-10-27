import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app_project/utils/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  //const CustomTextField({Key? key}) : super(key: key);
  final String label;
  final Icon? icon;
  bool? isHidden;
  TextEditingController? controller;
  FocusNode? focusNode;
  Function(String?)? onSubmitted;
  CustomTextField(
      {required this.label,
      this.focusNode,
      this.icon,
      this.isHidden,
      this.onSubmitted,
      this.controller,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextField(
        focusNode: focusNode,
        onSubmitted: onSubmitted,
        obscureText: isHidden ?? false,
        controller: controller,
        enabled: true,
        cursorColor: AppColors.primaryColor,
        decoration: InputDecoration(
          hintText: "Enter " + label,
          suffixIcon: icon,
          contentPadding: const EdgeInsetsDirectional.only(start: 25),
          focusedBorder: customInputBorder(Colors.black),
          errorBorder: customInputBorder(Colors.pinkAccent),
          labelText: label,
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
