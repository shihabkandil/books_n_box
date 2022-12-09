import 'package:flutter/material.dart';
import 'package:mobile_app_project/screens/home_screen/widgets/app_title.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          icon: Icon(Icons.menu, color: Colors.white, size: 40),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        AppTitle(),
      ],
    );
  }
}
