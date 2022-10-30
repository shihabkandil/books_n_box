import 'package:flutter/material.dart';
import 'package:mobile_app_project/screens/home_screen/widgets/app_title.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

     children: [

         AppTitle(),

         Container(
          padding: EdgeInsets.all(15),
           child: CircleAvatar(
            backgroundImage: AssetImage("assets/images/bilalprofile.jpg"), radius:25
                 ),
         ), 

    ],
    );
  }
}