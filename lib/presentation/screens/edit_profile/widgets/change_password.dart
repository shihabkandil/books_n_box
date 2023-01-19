import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app_project/business_logic/cubit/user_cubit/cubit/user_cubit.dart';

import '../../../../utils/enums/profile_enum.dart';
import '../../widgets/change_password_form.dart';


class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
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
      body: BlocListener<UserCubit, UserState>(
        listener: (context, state) {
          if (state.status == ProfileStatus.profileUpdateSuccess) {
            context.go('/home');
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content:
                    Text(state.message ?? localization.updatingSuccessful)));
          } else if (state.status == ProfileStatus.profileUpdateFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.message ??
                    localization.updatingFailed))); //errorupdating
          } else if (state.status == ProfileStatus.reauthenticationFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(localization.wrongPassword))); //password error
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
                ChangePasswordForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
