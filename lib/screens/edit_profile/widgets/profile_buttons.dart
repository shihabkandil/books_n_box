import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../business_logic/cubit/auth_cubit/auth_cubit.dart';

class ProfileButtons extends StatelessWidget {
  const ProfileButtons(
      {required this.confirmPasswordController,
      required this.emailController,
      required this.nameController,
      required this.formKey,
      super.key});
  final formKey;
  final TextEditingController emailController;
  final TextEditingController nameController;
  final TextEditingController confirmPasswordController;
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
          onPressed: () {},
          child: Text(localization!.cancel,
              style: TextStyle(
                  fontSize: 14,
                  letterSpacing: 2.2,
                  color: Theme.of(context).textTheme.bodyMedium?.color)),
        ),
        MaterialButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              BlocProvider.of<AuthCubit>(context).registerEmailAccount(
                  username: nameController.text.trim(),
                  email: emailController.text.trim(),
                  confirmedPassword: confirmPasswordController.text);
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
                fontSize: 14,
                letterSpacing: 2.2,
                color: Theme.of(context).textTheme.bodyMedium?.color),
          ),
        )
      ],
    );
  }
}
