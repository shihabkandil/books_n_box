import 'package:flutter/material.dart';

class BuildTextFields extends StatefulWidget {
  BuildTextFields(
      {this.labelText,
      this.placeholder,
      this.initialValue,
      this.isPasswordTextField,
      this.validator,
      this.controller,
      super.key});
  final String? labelText;
  final String? initialValue;
  final String? Function(String?)? validator;
  final String? placeholder;
  final bool? isPasswordTextField;
  final TextEditingController? controller;
  @override
  State<BuildTextFields> createState() => _BuildTextFieldsState();
}

class _BuildTextFieldsState extends State<BuildTextFields> {
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextFormField(

        initialValue: widget.initialValue,
        validator: widget.validator,
        style: TextStyle(
          color: Theme.of(context).textTheme.bodyMedium?.color,
        ),
        obscureText: widget.isPasswordTextField! ? hidePassword : false,
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
                      hidePassword = !hidePassword;
                    });
                  },
                  icon: Icon(
                    hidePassword ? Icons.visibility_off : Icons.visibility,
                    color: Theme.of(context).textTheme.bodyMedium?.color,
                  ),
                )
              : null,
          contentPadding: EdgeInsets.only(bottom: 3),
          labelText: widget.labelText,
          labelStyle: TextStyle(
            fontSize: 20,
            color: Theme.of(context).textTheme.bodyMedium!.color,
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
