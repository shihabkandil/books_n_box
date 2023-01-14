import 'package:flutter/material.dart';
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
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {},
        ),
      ),
      body: Container(
        color: Theme.of(context).backgroundColor,
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: ListView(
              children: [
                Text(
                  localization!.editProfile,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 15,
                ),
                ProfileImage(),
                SizedBox(
                  height: 35,
                ),
                BuildTextFields(
                    labelText: localization.username,
                    placeholder: "",
                    isPasswordTextField: false),
                BuildTextFields(
                    labelText: localization.emailAddress,
                    placeholder: "",
                    isPasswordTextField: false),
                BuildTextFields(
                    labelText: localization.password,
                    placeholder: "",
                    isPasswordTextField: true),
                SizedBox(
                  height: 35,
                ),
                ProfileButtons(),
              ],
            )),
      ),
    );
  }
}
