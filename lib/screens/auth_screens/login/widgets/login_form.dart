import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app_project/business_logic/cubit/auth_cubit/auth_cubit.dart';
import 'package:mobile_app_project/utils/screen_block_size.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'center_logo.dart';
import 'center_title.dart';
import 'google_button.dart';
import 'login_button.dart';
import '../../../shared/widgets/custom_text_field.dart';
import 'remember_me_row.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  static const Color iconColor = Color.fromARGB(170, 0, 0, 0);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(listener: (context, state) {
      if (state.status == AuthenticationStatus.googleSignInSuccess) {
        context.go("/home");
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Sign in with google failed")));
      }
    }, child: ResponsiveBuilder(builder: (context, screenConfig) {
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
                  label: "Email Address",
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
              Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: sizeConfig.verticalBlockSize)),
              CustomTextField(
                label: "Password",
                icon: Icon(
                  Icons.visibility,
                  color: iconColor,
                ),
                isHidden: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your password";
                  }
                  return null;
                },
              ),
              RememberMeRow(sizingConfig: sizeConfig),
              Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: sizeConfig.verticalBlockSize * 2)),
              LoginButton(_formKey, "Log In"),
              Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: sizeConfig.verticalBlockSize)),
              GoogleButton("Log In with Google"),
            ],
          ),
        ),
      );
    }));
  }
}
