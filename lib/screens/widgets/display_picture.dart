// A widget that displays the picture taken by the user.
import 'dart:io';
import 'package:flutter/material.dart';

import 'bottom_bar.dart';

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;
  final String text;

  DisplayPictureScreen(
      {super.key, required this.imagePath, required this.text});

  @override
  Widget build(BuildContext context) {
    // print("display "+this.text);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Text('Recognized Text'),
        backgroundColor: Theme.of(context).primaryColorDark,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      // bottomNavigationBar: AppBottomNavBar(
      //   index: 1,
      // ),
      body: SingleChildScrollView(
        child: Row(
          children: [
            SizedBox(
              width: 40,
            ),
            Expanded(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        child: Image.file(File(imagePath)),
                        height: 400,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Recognized Lines of Text: ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    this.text,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 40,
            ),
          ],
        ),
      ),
    );
  }
}
