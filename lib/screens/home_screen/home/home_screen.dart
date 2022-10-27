import 'package:flutter/material.dart';
import 'package:mobile_app_project/utils/constants/app_colors.dart';
import '../../shared/widgets/app_bottom_navigator.dart';
import '../widgets/api_tabbar.dart';
import '../widgets/header_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      extendBody: true,
      backgroundColor: Theme.of(context).primaryColor.withOpacity(0.9),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.white,
          flexibleSpace: Image.asset(
            'assets/Logo_Blue.png',
          ),
          leading: IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.black,
            ),
            onPressed: () {},
          ),

          actions: [
            const IconButton(
              onPressed: null,
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
          ],

        ),
      ),

      drawer: Drawer(),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: EdgeInsets.all(10),
                child: HeaderText(text: "Choose Source")
                ),
            ApiTabbar(),
          ],
        ),
      ),
        bottomNavigationBar: const AppBottomNavigator(),

    )
    );
  }
}
