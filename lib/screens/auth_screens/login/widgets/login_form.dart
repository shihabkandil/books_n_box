import 'package:flutter/material.dart';
import 'center_logo.dart';
import 'center_title.dart';
import 'google_button.dart';
import 'login_button.dart';
import 'outlined_textfield.dart';
import 'remember_me_row.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);
  static const Color iconColor = Color.fromARGB(170, 0, 0, 0);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Center(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.symmetric(vertical: 30)),
            const CenterLogo(),
            const CenterTitle("Log In"),
            CustomTextField(
                "Email Address",
                const Icon(
                  Icons.email_sharp,
                  color: iconColor,
                ),
                false),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            CustomTextField(
                "Password",
                const Icon(
                  Icons.visibility,
                  color: iconColor,
                ),
                true),
            const RememberMeRow(),
            const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
            const LoginButton("Log In"),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            const GoogleButton("Log In with Google"),
          ],
        ),
      ),
    );
  }
}
