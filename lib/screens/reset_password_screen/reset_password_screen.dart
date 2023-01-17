import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import '../../business_logic/cubit/auth_cubit/auth_cubit.dart';
import '../widgets/button.dart';
import '../widgets/custom_text_field.dart';


class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AppLocalizations localization = AppLocalizations.of(context)!;

    double verticalBlockSize = MediaQuery.of(context).size.height / 100;
    double horizontalBlockSize = MediaQuery.of(context).size.width / 100;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: BlocListener<AuthCubit,AuthState>(
          listener: (context, state) {
            if(state.status == AuthenticationStatus.resetEmailSentSuccessfully){
              context.pop();
            }
            else if(state.status == AuthenticationStatus.resetEmailSendFailed){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(localization.problem_sending_email)));
            }
          },
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: horizontalBlockSize * 80,
                      child: Image.asset('assets/images/reset-password.png')),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: Text(
                      textAlign: TextAlign.center,
                      localization.reset_password_instructions,
                      style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).textTheme.bodyMedium?.color),
                    ),
                  ),
                  SizedBox(height: verticalBlockSize * 4),
                  /// TODO refactor field validators
                  CustomTextField(
                      hintText: localization.emailAddress,
                      onSaved: (emailText) {
                        BlocProvider.of<AuthCubit>(context)
                            .resetPassword(email: emailText);
                      },
                      validator: (email) {
                        if (email!.isEmpty) {
                          return localization.emptyEmail;
                        } else if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(email)) {
                          return localization.invalidEmail;
                        }
                        return null;
                      }),
                  SizedBox(height: verticalBlockSize * 2),
                  Button(
                    text: localization.reset_password,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState?.save();
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
