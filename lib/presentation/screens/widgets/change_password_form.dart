import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../edit_profile/widgets/build_text_fieds.dart';
import '../edit_profile/widgets/profile_buttons.dart';



class ChangePasswordForm extends StatefulWidget {
  ChangePasswordForm({super.key});

  @override
  State<ChangePasswordForm> createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  bool showPassword = false;

  String? _password;

  final formKey = GlobalKey<FormState>();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController currentPasswordController =
      TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);

    return Form(
      key: formKey,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 75),
          child: Column(
            children: [
              BuildTextFields(
                labelText: localization!.current + ' ' + localization.password,
                controller: currentPasswordController,
                placeholder: '',
                validator: (input) {
                  if (!input!.isEmpty) {
                    if (input.length < 8) {
                      return localization.shortPass;
                    }
                  }
                  return null;
                },
                isPasswordTextField: true,
              ),
              SizedBox(
                height: 5,
              ),
              BuildTextFields(
                labelText: localization.nw + ' ' + localization.password,
                controller: passwordController,
                placeholder: '',
                validator: (input) {
                  _password = input;
                  if (!input!.isEmpty) {
                    if (input.length < 8) {
                      return localization.shortPass;
                    }
                  }
                  return null;
                },
                isPasswordTextField: true,
              ),
              SizedBox(
                height: 5,
              ),
              BuildTextFields(
                labelText: localization.confirmPass,
                controller: confirmPasswordController,
                placeholder: '',
                validator: (value) {
                  if (value != _password) {
                    return localization.confirmError;
                  }
                  return null;
                },
                isPasswordTextField: true,
              ),
              ProfileButtons(
                formKey: formKey,
                confirmPasswordController: confirmPasswordController,
                currentPasswordController: currentPasswordController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
