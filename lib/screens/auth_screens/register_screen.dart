import 'package:flutter/material.dart';
import 'package:mobile_app_project/utils/constants/app_colors.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

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
