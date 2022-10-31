import 'package:flutter/material.dart';

class ProfileButtons extends StatelessWidget {
  const ProfileButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MaterialButton(
          padding: EdgeInsets.symmetric(horizontal: 50),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          onPressed: () {},
          child: Text("CANCEL",
              style: TextStyle(
                  fontSize: 14, letterSpacing: 2.2, color: Colors.white)),
        ),
        MaterialButton(
          onPressed: () {},
          color: Theme.of(context).primaryColor,
          padding: EdgeInsets.symmetric(horizontal: 50),
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Text(
            "SAVE",
            style: TextStyle(
                fontSize: 14, letterSpacing: 2.2, color: Colors.white),
          ),
        )
      ],
    );
  }
}
