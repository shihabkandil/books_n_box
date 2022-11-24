import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:image_picker/image_picker.dart';

class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({Key? key, int? index})
      : _index = index ?? 0,
        super(key: key);

  final int _index;

  @override
  Widget build(BuildContext context) {
    return GNav(
      selectedIndex: _index,
      gap: 12,
      activeColor: Colors.white,
      iconSize: 24,
      tabMargin: EdgeInsets.only(top: 12),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      duration: Duration(milliseconds: 400),
      tabBackgroundColor: Colors.white10,
      color: Colors.grey,
      tabs: [
        GButton(
          icon: CupertinoIcons.home,
          text: 'Home',
        ),
        GButton(
          icon: Icons.camera_alt,
          text: 'Camera',
          onPressed: () async {
            // WidgetsFlutterBinding.ensureInitialized();

            // // Obtain a list of the available cameras on the device.
            // final cameras = await availableCameras();

            // // Get a specific camera from the list of available cameras.
            // final firstCamera = cameras.first;

            context.go("/recognizeText"); //   /home/recognizeText
          },
        ),
        GButton(
          icon: CupertinoIcons.search,
          text: 'Search',
          onPressed: () {},
        ),
      ],
    );
  }
}
