import 'package:flutter/material.dart';


class ProfileAvatarCircle extends StatelessWidget {
  const ProfileAvatarCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
            padding: EdgeInsets.all(15),
             child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/bilalprofile.jpg"), radius:60
             ),
           ),

        Text(
          "Bilal Ghareeb",
          style: TextStyle(
            color: Colors.white,
            
            ),
          ),
      ],
     
    );
  }
}