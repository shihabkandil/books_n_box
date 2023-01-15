import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app_project/business_logic/cubit/upload_image_cubit/cubit/upload_image_cubit.dart';

import '../../../business_logic/cubit/auth_cubit/auth_cubit.dart';
import 'profile_image.dart';

class ProfileButtons extends StatelessWidget {
  const ProfileButtons(
      {this.confirmPasswordController,
      this.emailController,
      this.nameController,
      this.currentPasswordController,
      required this.formKey,
      super.key});
  final GlobalKey<FormState> formKey;
  final TextEditingController? emailController;
  final TextEditingController? currentPasswordController;
  final TextEditingController? nameController;
  final TextEditingController? confirmPasswordController;
  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MaterialButton(
          padding: EdgeInsets.symmetric(horizontal: 50),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          onPressed: () {
            context.go('/home');
          },
          child: Text(localization!.cancel,
              style: TextStyle(
                  fontSize: 14,
                  letterSpacing: 2.2,
                  color: Theme.of(context).textTheme.bodyMedium?.color)),
        ),
        MaterialButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              // var img = state.image;
              // print(img?.path);
              // print('oooooooooooooooooooooooooooooooo');
              BlocProvider.of<AuthCubit>(context).UpdateProfile(
                  currentPass: currentPasswordController?.text.trim(),
                  name: nameController?.text.trim(),
                  email: emailController?.text.trim(),
                  pass: confirmPasswordController?.text.trim(),
                  imageURL: img?.path);
            }
          },
          color: Theme.of(context).primaryColor,
          padding: EdgeInsets.symmetric(horizontal: 50),
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Text(
            localization.save,
            style: TextStyle(
                fontSize: 14, letterSpacing: 2.2, color: Colors.white),
          ),
        )
      ],
    );
  }
}
