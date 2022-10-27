import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app_project/business_logic/cubit/auth_cubit/auth_cubit.dart';
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
              children: [
                Padding(padding: EdgeInsets.symmetric(vertical: 30)),
                CenterLogo(),
                Container(
                    margin: EdgeInsets.all(20),
                    child: CenterTitle("Log In")),
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
