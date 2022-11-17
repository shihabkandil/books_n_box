import 'package:flutter/material.dart';
import '../widgets/build_text_fieds.dart';
import '../widgets/profile_buttons.dart';
import '../widgets/profile_image.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
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
                  "Edit Profile",
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
                    labelText: "Full Name",
                    placeholder: "",
                    isPasswordTextField: false),
                BuildTextFields(
                    labelText: "E-mail",
                    placeholder: "",
                    isPasswordTextField: false),
                BuildTextFields(
                    labelText: "Password",
                    placeholder: "",
                    isPasswordTextField: true),
                BuildTextFields(
                    labelText: "Location",
                    placeholder: "",
                    isPasswordTextField: false),
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
