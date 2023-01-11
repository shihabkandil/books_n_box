import 'package:flutter/material.dart';

class BuildTextFields extends StatefulWidget {
  BuildTextFields(
      {this.labelText, this.placeholder, this.isPasswordTextField, super.key});
  final String? labelText;
  final String? placeholder;
  final bool? isPasswordTextField;

  @override
  State<BuildTextFields> createState() => _BuildTextFieldsState();
}

class _BuildTextFieldsState extends State<BuildTextFields> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        style: TextStyle(
          color: Theme.of(context).textTheme.bodyMedium?.color,
        ),
        obscureText: widget.isPasswordTextField! ? showPassword : false,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          suffixIcon: widget.isPasswordTextField!
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: Theme.of(context).textTheme.bodyMedium?.color,
                  ),
                )
              : null,
          contentPadding: EdgeInsets.only(bottom: 3),
          labelText: widget.labelText,
          labelStyle: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: widget.placeholder,
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textTheme.bodyMedium?.color,
          ),
        ),
      ),
    );
  }
}
