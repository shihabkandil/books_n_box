import 'package:flutter/material.dart';
import 'package:mobile_app_project/utils/constants/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final Icon? icon;
  final String? password;
  bool? isHidden;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;

  CustomTextField(
      {required this.hintText,
      this.focusNode,
      this.validator,
      this.password,
      this.icon,
      this.isHidden,
      this.onSaved,
      this.controller,
      Key? key})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool hide = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextFormField(
        onSaved: widget.onSaved,
        validator: widget.validator,
        focusNode: widget.focusNode,
        //onSubmitted: onSubmitted,
        obscureText: widget.isHidden! ? hide : false,
        controller: widget.controller,
        enabled: true,
        cursorColor: AppColors.primaryColor,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white.withOpacity(0.8),
            hintText: widget.hintText,
            suffixIcon: (widget.isHidden!
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        hide = !(hide);
                      });
                    },
                    icon: Icon(
                      color: widget.icon!.color,
                      hide ? Icons.visibility_off : Icons.visibility,
                    ),
                  )
                : widget.icon),
            contentPadding: const EdgeInsetsDirectional.only(start: 25),
            focusedBorder: customInputBorder(Colors.black),
            errorBorder: customInputBorder(Colors.pinkAccent),
            enabledBorder: customInputBorder(Colors.black),
            focusedErrorBorder: customInputBorder(Colors.black)),
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
