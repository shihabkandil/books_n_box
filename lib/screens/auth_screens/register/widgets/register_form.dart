import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../../utils/screen_block_size.dart';//
import '../../../shared/widgets/custom_text_field.dart';
import '../../login/widgets/center_logo.dart';
import '../../login/widgets/center_title.dart';
import '../../../shared/widgets/button.dart';

class RegisterForm extends StatefulWidget {
  RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _passwordFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
        builder: (context,screenConfig) {
          final ScreenBlockSize sizeConfig = ScreenBlockSize(screenSizeConfig: screenConfig);
          return Form(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: sizeConfig.verticalBlockSize * 3.5),
              child: Column(
                children: [
                  CenterLogo(width: sizeConfig.horizontalBlockSize * 94),
                  SizedBox(height: sizeConfig.verticalBlockSize,),
                  CenterTitle("Register"),
                  CustomTextField(
                      label: "Username",
                      icon: Icon(
                        Icons.person,
                        color: Colors.white.withOpacity(0.8),
                      ),
                      isHidden: false),
                  SizedBox(height: sizeConfig.verticalBlockSize,),
                  CustomTextField(
                      label: "Email Address",
                      icon: Icon(
                        Icons.email_sharp,
                        color: Colors.white.withOpacity(0.8),
                      ),
                      isHidden: false),
                  SizedBox(height: sizeConfig.verticalBlockSize,),
                  CustomTextField(
                      icon: Icon(
                        Icons.visibility,
                        color: Colors.white.withOpacity(0.8),
                      ),
                      isHidden: true, label: 'Password',),
                  SizedBox(height: sizeConfig.verticalBlockSize,),
                  CustomTextField(
                    icon: Icon(
                      Icons.visibility,
                      color: Colors.white.withOpacity(0.8),
                    ),
                    isHidden: true, label: 'Confirm Password',),
                  SizedBox(height: sizeConfig.verticalBlockSize * 5,),
                  Button("Register"),
                ],
              ),
            ),
          );
        }
    );
  }

  @override
  void dispose() {
    _confirmPasswordFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }
}
