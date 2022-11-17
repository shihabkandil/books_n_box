import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app_project/screens/home_screen/widgets/tile_template.dart';
import 'package:mobile_app_project/utils/constants/app_colors.dart';

import '../../widgets/profile_avatar_circle.dart';

class ShelfColumn extends StatelessWidget {
  const ShelfColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(50),
      child: Column(
        children: [
          ProfileAvatarCircle(),
          SizedBox(
            height: 20,
          ),
          TileTemplate(
              icon: Icon(Icons.person, color: Colors.white),
              callback: () {},
              text: Text(
                "Profile",
                style: TextStyle(color: Colors.white),
              ),
              tail: Icon(Icons.arrow_forward, color: Colors.white),
              color: AppColors.tileColor.withOpacity(0.7)),
          SizedBox(
            height: 20,
          ),
          TileTemplate(
              icon: Icon(Icons.settings, color: Colors.white),
              callback: () => context.go('/home/settings'),
              text: Text("Settings", style: TextStyle(color: Colors.white)),
              tail: Icon(Icons.arrow_forward, color: Colors.white),
              color: AppColors.tileColor.withOpacity(0.7)),
          SizedBox(
            height: 20,
          ),
          TileTemplate(
              icon: Icon(Icons.logout, color: Colors.white),
              callback: () {},
              text: Text("Logout", style: TextStyle(color: Colors.white)),
              tail: Icon(Icons.arrow_forward, color: Colors.white),
              color: Colors.red.withOpacity(0.7)),
        ],
      ),
    );
  }
}
