import 'package:flutter/material.dart';
import 'package:mobile_app_project/screens/main_screens/profile_screen/profile_data_block.dart';
import 'package:mobile_app_project/utils/grid_bg.dart';


import '../../shared/widgets/app_bottom_navigator.dart';



class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(

      extendBody: true,

      body: Stack(
        children: [

          Container(
            color: Theme.of(context).primaryColor.withOpacity(1),
          ),

          Align(
            alignment: Alignment.bottomCenter,

            child: GridBackGround(),

          ),

          ProfileDataBlock(),

          
        ],
      ),
      
      bottomNavigationBar: const AppBottomNavigator(),
    )

    );
  }
}
