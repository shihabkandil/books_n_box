import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String _label;
  final Icon _icon;
  final bool isHidden;

  const CustomTextField(this._label, this._icon, this.isHidden, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isHidden,
      controller: TextEditingController(text: ""),
      enabled: true,
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
        fillColor: Colors.white.withOpacity(0.8),
        filled: true,
        hintText: "Enter " + _label,
        suffixIcon: _icon,
        contentPadding: const EdgeInsetsDirectional.only(start: 20),
        focusedBorder: customInputBorder(Colors.black),
        errorBorder: customInputBorder(Colors.pinkAccent),
        enabledBorder: customInputBorder(Colors.black),
      ),
    );
  }

  OutlineInputBorder customInputBorder(Color c) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(width: 1, color: c),
    );
  }
}
