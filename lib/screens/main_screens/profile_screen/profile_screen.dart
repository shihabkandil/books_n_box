import 'package:flutter/material.dart';
import 'package:mobile_app_project/screens/home_screen/widgets/api_tabbar.dart';
import 'package:mobile_app_project/screens/home_screen/widgets/tabbar(V2).dart';
import 'package:mobile_app_project/screens/main_screens/profile_screen/profile_data_block.dart';
import 'package:mobile_app_project/utils/grid_bg.dart';
import '../../shared/widgets/app_bottom_navigator.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      extendBody: true,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ProfileDataBlock(),
            TabbarV2(
              var_height: MediaQuery.of(context).size.height,
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppBottomNavigator(),
    ));
  }
}
