import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app_project/business_logic/cubit/auth_cubit/auth_cubit.dart';

import 'build_text_fieds.dart';
import 'profile_buttons.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).textTheme.bodyMedium!.color,
          ),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.status == AuthenticationStatus.profileUpdateSuccess) {
            context.go('/home');
            if (state.message != null) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                      state.message ?? localization.verifyMail))); //verifyMail
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content:
                      Text(state.message ?? localization.updatingSuccessful)));
            }
          } else if (state.status ==
              AuthenticationStatus.profileUpdateFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.message ??
                    localization.updatingFailed))); //errorupdating
          } else if (state.status ==
              AuthenticationStatus.reauthenticationFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                    localization.wrongPassword))); //email or password error
          }
        },
        child: Container(
          color: Theme.of(context).backgroundColor,
          padding: EdgeInsets.only(left: 16, top: 25, right: 16),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: ListView(
              children: [
                Text(
                  localization!.changePass,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).textTheme.bodyMedium!.color),
                ),
                Form(
                    key: formKey,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 75),
                        child: Column(
                          children: [
                            BuildTextFields(
                              labelText: localization.current +
                                  '' +
                                  localization.password,
                              controller: currentPasswordController,
                              placeholder: '',
                              validator: (input) {
                                // _password = input;
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
                              labelText: localization.nw +
                                  ' ' +
                                  localization.password,
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
                              confirmPasswordController:
                                  confirmPasswordController,
                              currentPasswordController:
                                  currentPasswordController,
                            ),
                          ],
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
