import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app_project/business_logic/cubit/auth_cubit/auth_cubit.dart';
import 'package:mobile_app_project/utils/screen_block_size.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'center_logo.dart';
import 'center_title.dart';
import 'dont_have_Account_text.dart';
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
        child:ResponsiveBuilder(
          builder: (context,screenConfig) {
            final ScreenBlockSize sizeConfig = ScreenBlockSize(screenSizeConfig: screenConfig);
            return Form(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: sizeConfig.verticalBlockSize * 3.5),
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.symmetric(
                        vertical: sizeConfig.verticalBlockSize)),
                    CenterLogo(width: sizeConfig.horizontalBlockSize * 94),
                    CenterTitle("Log In"),
                    CustomTextField(
                        "Email Address",
                        Icon(
                          Icons.email_sharp,
                          color: iconColor,
                        ),
                        false),
                    Padding(padding: EdgeInsets.symmetric(vertical: sizeConfig.verticalBlockSize)),
                    CustomTextField(
                        "Password",
                        Icon(
                          Icons.visibility,
                          color: iconColor,
                        ),
                        true),
                    RememberMeRow(sizingConfig: sizeConfig),
                    Padding(padding: EdgeInsets.symmetric(vertical: sizeConfig.verticalBlockSize * 2)),
                    LoginButton("Log In"),
                    Padding(padding: EdgeInsets.symmetric(vertical: sizeConfig.verticalBlockSize)),
                    GoogleButton("Log In with Google"),
                    Divider(height: 50,),
                    DontHaveAccountText(text:"Dont have an account? Register",screenBlockSize: sizeConfig,onTap: ()=> context.go('/register'),)
                  ],
                ),
              ),
            );
          }
        )
    );
  }
}
