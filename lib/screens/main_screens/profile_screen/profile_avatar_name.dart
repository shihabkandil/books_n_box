import 'package:flutter/material.dart';

class ProfileAvatarName extends StatelessWidget {
  const ProfileAvatarName({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         CircleAvatar(
          backgroundImage: AssetImage("assets/images/bilalprofile.jpg"), radius:45
        ),
              
         SizedBox(height: 10,),
              
         Text(
         "Bilal Ghareeb",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black)
        ),
      ],
    );
  }
}