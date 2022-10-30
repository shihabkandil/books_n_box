import 'package:flutter/material.dart';
import 'package:mobile_app_project/screens/auth_screens/register/widgets/register_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Theme.of(context).primaryColor,
          child: Column(
            children: [
              Expanded(
                child: Image.asset(
                  'assets/Logo_White.png',
                  width: 340,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  decoration:  BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20)),
                  ),
                  child: RegisterForm(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
