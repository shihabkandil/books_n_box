import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../business_logic/cubit/auth_cubit/auth_cubit.dart';
import '../../../utils/screen_block_size.dart';
import '../../widgets/button.dart';
import '../../widgets/custom_text_field.dart';
import 'center_logo.dart';
import 'center_title.dart';
import 'dont_have_Account_text.dart';
import 'google_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'reset_password.dart';

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
    var localization = AppLocalizations.of(context);

    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.status == AuthenticationStatus.googleSignInSuccess) {
          context.go("/home");
        } else if (state.status == AuthenticationStatus.emailLoginSuccess) {
          context.go("/home");
        } else if (state.status == AuthenticationStatus.emailLoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message ?? localization!.loginError)));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(localization!.googleLoginError)));
        }
      },
      child: ResponsiveBuilder(builder: (context, screenConfig) {
        final ScreenBlockSize sizeConfig = ScreenBlockSize(screenSizeConfig: screenConfig);
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
                CenterTitle(localization!.logIn),
                CustomTextField(
                    controller: emailController,
                    hintText: localization.enter + localization.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return localization.emptyEmail;
                      } else if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                        return localization.invalidEmail;
                      }
                      return null;
                    },
                    icon: Icon(
                      Icons.email_sharp,
                      color: iconColor,
                    ),
                    isPassword: false),
                SizedBox(
                  height: sizeConfig.verticalBlockSize,
                ),
                CustomTextField(
                    controller: passwordController,
                    hintText: localization.enter + localization.password,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return localization.emptyPassword;
                      }
                      return null;
                    },
                    icon: Icon(
                      Icons.visibility,
                      color: iconColor,
                    ),
                    isPassword: true,),
                ResetPassword(
                  sizingConfig: sizeConfig,
                ),
                SizedBox(
                  height: sizeConfig.verticalBlockSize,
                ),
                Button(
                  formKey: _formKey,
                  text: localization.logIn,
                  onPressed: (() {
                    if (_formKey.currentState!.validate()) {
                      BlocProvider.of<AuthCubit>(context)
                          .loginWithEmailAndPassword(
                              email: emailController.text.trim(),
                              password: passwordController.text);
                    }
                  }),
                ),
                SizedBox(
                  height: sizeConfig.verticalBlockSize,
                ),
                GoogleButton(localization.googleLogin),
                Divider(
                  height: sizeConfig.verticalBlockSize * 4,
                ),
                DontHaveAccountText(
                  text: localization.noAccount,
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
