import 'package:flutter/material.dart';
import 'package:mobile_app_project/utils/constants/app_colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          color: AppColors.primaryColor,
      ),
    );
  }
}
