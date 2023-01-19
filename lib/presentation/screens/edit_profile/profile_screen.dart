import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app_project/business_logic/cubit/upload_image_cubit/cubit/upload_image_cubit.dart';
import '../../../../business_logic/cubit/auth_cubit/auth_cubit.dart';
import 'widgets/build_text_fieds.dart';
import 'widgets/profile_buttons.dart';
import 'widgets/profile_image.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool showPassword = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  // String? _password;
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
          } else if (state.status == AuthenticationStatus.imageUploadFailed) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.message ??
                    localization.imageUploadFailed))); //errorupoading
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
                BlocProvider(
                  create: (context) => UploadImageCubit(),
                  child: Form(
                    key: formKey,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 0),
                        child: Column(
                          children: [
                            Text(
                              localization!.editProfile,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .color),
                            ),
                            SizedBox(
                              height: 35,
                            ),
                            ProfileImage(
                              userPath: user.photoURL,
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
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor),
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
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
