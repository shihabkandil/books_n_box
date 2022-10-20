import 'package:flutter/material.dart';
import 'login/login_form.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: LoginForm(),
        ),
      ),
    );
  }
}
