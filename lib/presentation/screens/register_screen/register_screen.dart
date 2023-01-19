import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business_logic/cubit/upload_image_cubit/cubit/upload_image_cubit.dart';
import 'widgets/register_form.dart';



class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocProvider(
            create: (context) => UploadImageCubit(),
            child: RegisterForm(),
          ),
        ),
      ),
    );
  }
}
