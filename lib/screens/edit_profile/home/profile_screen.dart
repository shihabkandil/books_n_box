import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app_project/data/repository/auth_repository.dart';
import '../../../business_logic/cubit/auth_cubit/auth_cubit.dart';
import '../widgets/build_text_fieds.dart';
import '../widgets/profile_buttons.dart';
import '../widgets/profile_image.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool showPassword = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  String? _password;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);
    var user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      context.go("/home");
    }

    nameController.text = user!.displayName ?? '';
    emailController.text = user.email ?? '';
    // passwordController.text = user.pas ?? '';

    //  = repo.currentUser;
    // user.uid
    print(user.toString());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).textTheme.bodyMedium!.color,
          ),
          onPressed: () {},
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
            // context.go("/home");
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
            child: Form(
              key: formKey,
              child: ListView(
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
                    height: 25,
                  ),
                  ProfileImage(),
                  SizedBox(
                    height: 35,
                  ),
                  BuildTextFields(
                    labelText: localization.username,
                    // initialValue: user?.displayName,
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
                  BuildTextFields(
                    labelText:
                        localization.current + '' + localization.password,
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
                  SizedBox(
                    height: 35,
                  ),
                  ProfileButtons(
                    formKey: formKey,
                    confirmPasswordController: confirmPasswordController,
                    currentPasswordController: currentPasswordController,
                    emailController: emailController,
                    nameController: nameController,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
