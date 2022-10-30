import 'package:flutter/material.dart';
import 'widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: LoginForm(),
        ),
      ),
    );
  }
}
