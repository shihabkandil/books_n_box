import 'package:flutter/material.dart';
import 'package:mobile_app_project/screens/auth_screens/register/widgets/register_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: RegisterForm(),
        ),
      ),
    );
  }
}
