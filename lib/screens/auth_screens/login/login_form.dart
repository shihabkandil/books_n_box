import 'package:flutter/material.dart';
import 'package:mobile_app_project/screens/auth_screens/login/center_logo.dart';
import 'package:mobile_app_project/screens/auth_screens/login/center_title.dart';
import 'package:mobile_app_project/screens/auth_screens/login/login_button.dart';
import 'package:mobile_app_project/screens/auth_screens/login/google_button.dart';
import 'package:mobile_app_project/screens/auth_screens/login/remember_me_row.dart';
import 'outlined_textfield.dart';

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
