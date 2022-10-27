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
  get iconColor => null;

  final _passwordFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CenterTitle("Sign Up",),
          CustomTextField(
            label: "Username",
            icon: Icon(
              Icons.account_circle_rounded,
              color: iconColor,
            ),
            isHidden: false,
            onSubmitted: (username_value) => _emailFocusNode.requestFocus(),
          ),
          const SizedBox(height: 20),
          CustomTextField(
            focusNode: _emailFocusNode,
            label: "Email Address",
            icon: Icon(
              Icons.email_sharp,
              color: iconColor,
            ),
            isHidden: false,
            onSubmitted: (user_name_value) => _passwordFocusNode.requestFocus(),
          ),
          const SizedBox(height: 20),
          CustomTextField(
            focusNode: _passwordFocusNode,
            label: "Password",
            icon: Icon(
              Icons.visibility,
              color: iconColor,
            ),
            isHidden: true,
            onSubmitted: (password_value) =>
                _confirmPasswordFocusNode.requestFocus(),
          ),
          const SizedBox(height: 20),
          CustomTextField(
            focusNode: _confirmPasswordFocusNode,
            label: "Confirm Password",
            icon: Icon(
              Icons.visibility,
              color: iconColor,
            ),
            isHidden: true,
          ),
          const AgreeToTerms()
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _confirmPasswordFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }
}
