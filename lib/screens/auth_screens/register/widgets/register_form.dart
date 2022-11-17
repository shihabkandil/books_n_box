import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app_project/business_logic/cubit/auth_cubit/auth_cubit.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../../utils/screen_block_size.dart';
import '../../../widgets/button.dart';
import '../../../widgets/custom_text_field.dart';
import '../../login/widgets/center_logo.dart';
import '../../login/widgets/center_title.dart';

class RegisterForm extends StatefulWidget {
  RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _passwordFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  String? _password;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(listener: (context, state) {
      if (state.status == AuthenticationStatus.emailRegisterSuccess) {
        context.go("/home");
      } else if (state.status == AuthenticationStatus.emailRegisterFailure) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.message ?? 'Can\'t register account')));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Account Registration failed")));
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
              CenterLogo(width: sizeConfig.horizontalBlockSize * 94),
              SizedBox(
                height: sizeConfig.verticalBlockSize,
              ),
              CenterTitle("Register"),
              CustomTextField(
                  hintText: "Username",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter username";
                    }
                    return null;
                  },
                  icon: Icon(
                    Icons.person,
                    color: Colors.white.withOpacity(0.8),
                  ),
                  isHidden: false),
              SizedBox(
                height: sizeConfig.verticalBlockSize,
              ),
              CustomTextField(
                  controller: _emailController,
                  hintText: "Email Address",
                  icon: Icon(
                    Icons.email_sharp,
                    color: Colors.white.withOpacity(0.8),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter email";
                    } else if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                      return "Please enter a valid email";
                    }
                    return null;
                  },
                  isHidden: false),
              SizedBox(
                height: sizeConfig.verticalBlockSize,
              ),
              CustomTextField(
                icon: Icon(
                  Icons.visibility,
                  color: Colors.white.withOpacity(0.8),
                ),
                validator: (value) {
                  _password = value;
                  if (value!.isEmpty) {
                    return "Please enter password";
                  } else if (value.length < 8) {
                    return "Password must be at least 8 characters";
                  }
                  return null;
                },
                isHidden: true,
                hintText: 'Password',
              ),
              SizedBox(
                height: sizeConfig.verticalBlockSize,
              ),
              CustomTextField(
                controller: _confirmPasswordController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please confirm password";
                  } else if (value != _password) {
                    return "Passwords don\'t match";
                  }
                  return null;
                },
                icon: Icon(
                  Icons.visibility,
                  color: Colors.white.withOpacity(0.8),
                ),
                isHidden: true,
                hintText: 'Confirm Password',
              ),
              SizedBox(
                height: sizeConfig.verticalBlockSize * 5,
              ),
              Button(
                formKey: _formKey,
                text: "Register",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    BlocProvider.of<AuthCubit>(context).registerEmailAccount(
                        email: _emailController.text.trim(),
                        confirmedPassword: _confirmPasswordController.text);
                  }
                },
              ),
            ],
          ),
        ),
      );
    }));
  }

  @override
  void dispose() {
    _confirmPasswordFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }
}
