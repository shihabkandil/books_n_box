import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app_project/business_logic/cubit/upload_image_cubit/cubit/upload_image_cubit.dart';
import 'package:mobile_app_project/business_logic/cubit/user_cubit/cubit/user_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../utils/enums/profile_enum.dart';
import '../../shared_widgets/back_icon_button.dart';
import '../widgets/update_profile_form.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool showPassword = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 1,
        leading: BackIconButton(),
      ),
      body: BlocListener<UserCubit, UserState>(
        listener: (context, state) {
          if (state.status == ProfileStatus.profileUpdateSuccess) {
            context.go('/home');
            if (state.message != null) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                      state.message ?? localization!.verifyMail))); //verifyMail
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content:
                      Text(state.message ?? localization!.updatingSuccessful)));
            }
          } else if (state.status == ProfileStatus.profileUpdateFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.message ??
                    localization!.updatingFailed))); //errorupdating
          } else if (state.status == ProfileStatus.imageUploadFailed) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.message ??
                    localization!.imageUploadFailed))); //errorupoading
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
                          child: UpdateProfileForm(
                              emailController: emailController,
                              nameController: nameController,
                              formKey: formKey)),
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
