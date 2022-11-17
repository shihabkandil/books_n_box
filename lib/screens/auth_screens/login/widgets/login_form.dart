import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app_project/business_logic/cubit/auth_cubit/auth_cubit.dart';
import 'package:mobile_app_project/utils/screen_block_size.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../widgets/button.dart';
import '../../../widgets/custom_text_field.dart';
import 'center_logo.dart';
import 'center_title.dart';
import 'dont_have_Account_text.dart';
import 'google_button.dart';
import 'remember_me_row.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  static const Color iconColor = Color.fromARGB(170, 0, 0, 0);
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.status == AuthenticationStatus.googleSignInSuccess) {
          context.go("/home");
        } else if (state.status == AuthenticationStatus.emailLoginSuccess) {
          context.go("/home");
        } else if (state.status == AuthenticationStatus.emailLoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message ?? 'Can\'t login to account')));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Sign in with google failed")));
        }
      },
      child: ResponsiveBuilder(builder: (context, screenConfig) {
        final ScreenBlockSize sizeConfig =
            ScreenBlockSize(screenSizeConfig: screenConfig);
        return Form(
          key: _formKey,
          child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: sizeConfig.verticalBlockSize * 3.5),
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: sizeConfig.verticalBlockSize)),
                CenterLogo(width: sizeConfig.horizontalBlockSize * 94),
                CenterTitle("Log In"),
                CustomTextField(
                  controller: emailController,
                    hintText: "Email Address",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter your email";
                      }
                      return null;
                    },
                    icon: Icon(
                      Icons.email_sharp,
                      color: iconColor,
                    ),
                    isHidden: false),
                SizedBox(
                  height: sizeConfig.verticalBlockSize,
                ),
                CustomTextField(
                  controller: passwordController,
                    hintText: "Password",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter your password";
                      }
                      return null;
                    },
                    icon: Icon(
                      Icons.visibility,
                      color: iconColor,
                    ),
                    isHidden: true),
                RememberMeRow(sizingConfig: sizeConfig),
                SizedBox(
                  height: sizeConfig.verticalBlockSize,
                ),
                Button(
                    formKey: _formKey,
                    text: "Log In",
                    onPressed: (() {
                      if (_formKey.currentState!.validate()) {
                        BlocProvider.of<AuthCubit>(context).loginWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text);
                      }
                    })),
                SizedBox(
                  height: sizeConfig.verticalBlockSize,
                ),
                GoogleButton("Log In with Google"),
                Divider(
                  height: sizeConfig.verticalBlockSize * 4,
                ),
                DontHaveAccountText(
                  text: "Dont have an account? Register",
                  screenBlockSize: sizeConfig,
                  onTap: () => context.go('/register'),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
