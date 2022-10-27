import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app_project/screens/auth_screens/login/widgets/remember_me_row.dart';
import 'center_logo.dart';
import 'center_title.dart';
import 'google_button.dart';
import 'login_button.dart';
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
            const SizedBox(height: 30),
            const CenterLogo(),
            const CenterTitle(
              title: "Log In",
              margin: EdgeInsets.symmetric(vertical: 30),
            ),
            CustomTextField(
              label: "Email Address",
              icon: const Icon(
                Icons.email_sharp,
                color: iconColor,
              ),
              isHidden: false,
            ),
            const SizedBox(height: 10),
            CustomTextField(
                label: "Password",
                icon: const Icon(
                  Icons.visibility,
                  color: iconColor,
                ),
                isHidden: true),
            const RememberMeRow(),
            const SizedBox(height: 20),
            const LoginButton("Log In"),
            const SizedBox(height: 10),
            const GoogleButton("Log In with Google"),
            const SizedBox(height: 30),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account ? ",
                    style: GoogleFonts.cairo(
                        fontWeight: FontWeight.bold,
                        color: Colors.black45,
                        fontSize: 16)),
                InkWell(
                  child: Text("Register",
                      style: GoogleFonts.cairo(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor)),
                  onTap: () => context.push('/register'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
