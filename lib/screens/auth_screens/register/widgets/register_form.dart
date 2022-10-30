import 'package:flutter/material.dart';
import '../../../shared/widgets/custom_text_field.dart';
import '../../login/widgets/center_title.dart';
import 'agree_to_terms_widget.dart';

class RegisterForm extends StatefulWidget {
  RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _passwordFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  String? _password;
  TextEditingController _pass = TextEditingController();
  TextEditingController _confirmPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CenterTitle(
              "Sign Up",
            ),
            CustomTextField(
              label: "Username",
              icon: Icon(
                Icons.account_circle_rounded,
                color: Colors.grey,
              ),
              isHidden: false,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter username";
                }
                return null;
              },
              onSubmitted: (username_value) => _emailFocusNode.requestFocus(),
            ),
            const SizedBox(height: 20),
            CustomTextField(
              focusNode: _emailFocusNode,
              label: "Email Address",
              icon: Icon(
                Icons.email_sharp,
                color: Colors.grey,
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter email";
                }
                return null;
              },
              isHidden: false,
              onSubmitted: (user_name_value) =>
                  _passwordFocusNode.requestFocus(),
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: _pass,
              focusNode: _passwordFocusNode,
              label: "Password",
              validator: (value) {
                _password = value;
                if (value!.isEmpty) {
                  return "Please enter password";
                } else if (value.length < 8) {
                  return "Password must be at least 8 characters";
                }
                return null;
              },
              icon: Icon(
                Icons.visibility,
                color: Colors.grey,
              ),
              isHidden: true,
              onSubmitted: (password_value) =>
                  _confirmPasswordFocusNode.requestFocus(),
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: _confirmPass,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please confirm password";
                } else if (value != _password) {
                  return "Incorrect password";
                }
                return null;
              },
              focusNode: _confirmPasswordFocusNode,
              label: "Confirm Password",
              icon: Icon(
                Icons.visibility,
                color: Colors.grey,
              ),
              isHidden: true,
            ),
            AgreeToTerms(_formKey)
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _confirmPasswordFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }
}
