import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

import '../edit_profile/widgets/build_text_fieds.dart';
import '../edit_profile/widgets/profile_buttons.dart';
import '../edit_profile/widgets/profile_image.dart';

class UpdateProfileForm extends StatelessWidget {
  UpdateProfileForm(
      {super.key,
      required this.emailController,
      required this.nameController,
      required this.formKey});
  final TextEditingController emailController;
  final TextEditingController nameController;
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);
    var user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      context.go("/home");
    }

    return Column(
      children: [
        Text(
          localization!.editProfile,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).textTheme.bodyMedium!.color),
        ),
        SizedBox(
          height: 35,
        ),
        ProfileImage(
          userPath: user!.photoURL,
        ),
        SizedBox(
          height: 45,
        ),
        BuildTextFields(
          labelText: localization.username,
          controller: nameController,
          isPasswordTextField: false,
          validator: (input) {
            if (input!.isEmpty) {
              return localization.emptyUsername;
            }
            return null;
          },
        ),
        BuildTextFields(
          labelText: localization.emailAddress,
          initialValue: user.email,
          controller: emailController,
          isPasswordTextField: false,
          validator: (input) {
            if (input!.isEmpty) {
              emailController.text = user.email!;
            } else if (!RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(input)) {
              return localization.invalidEmail;
            }
            return null;
          },
        ),
        TextButton(
          onPressed: () {
            context.go('/home/profile/changePassword');
          },
          child: Text(
            'Change password?',
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        ProfileButtons(
          formKey: formKey,
          emailController: emailController,
          nameController: nameController,
        ),
      ],
    );
  }
}
