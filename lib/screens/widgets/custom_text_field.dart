import 'package:flutter/material.dart';
import 'package:mobile_app_project/utils/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Icon? icon;
  final String? password;
  final bool? isHidden;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Function(String?)? onSubmitted;
  final String? Function(String?)? validator;

  CustomTextField(
      {required this.hintText,
      this.focusNode,
      this.validator,
      this.password,
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
      child: TextFormField(
        validator: validator,
        focusNode: focusNode,
        //onSubmitted: onSubmitted,
        obscureText: isHidden ?? false,
        controller: controller,
        enabled: true,
        cursorColor: AppColors.primaryColor,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white.withOpacity(0.8),
          hintText: "Enter " + hintText,
          suffixIcon: icon,
          contentPadding: const EdgeInsetsDirectional.only(start: 25),
          focusedBorder: customInputBorder(Colors.black),
          errorBorder: customInputBorder(Colors.pinkAccent),
          enabledBorder: customInputBorder(Colors.black),
          focusedErrorBorder: customInputBorder(Colors.black)
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
