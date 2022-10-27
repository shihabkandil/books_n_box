import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app_project/screens/auth_screens/login/widgets/remember_me_row.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app_project/business_logic/cubit/auth_cubit/auth_cubit.dart';
import 'center_logo.dart';
import 'center_title.dart';
import 'google_button.dart';
import 'login_button.dart';
import '../../../shared/widgets/custom_text_field.dart';
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
    return BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
      if(state.status == AuthenticationStatus.googleSignInSuccess){
        context.go("/home");
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Sign in with google failed")));
      }
    },
    child:Form(
      child: Center(
        child: Column(
          children: const [
            Padding(padding: EdgeInsets.symmetric(vertical: 30)),
            CenterLogo(),
            CenterTitle("Log In"),
            CustomTextField(
                "Email Address",
                Icon(
                  Icons.email_sharp,
                  color: iconColor,
                ),
                false),
            Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            CustomTextField(
                "Password",
                Icon(
                  Icons.visibility,
                  color: iconColor,
                ),
                true),
            RememberMeRow(),
            Padding(padding: EdgeInsets.symmetric(vertical: 20)),
            LoginButton("Log In"),
            Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            GoogleButton("Log In with Google"),
          ],
        ),
      ),
    )
    );
  }
}
