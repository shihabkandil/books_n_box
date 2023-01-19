// A widget that displays the picture taken by the user.
import 'dart:io';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;
  final String text;

  DisplayPictureScreen(
      {super.key, required this.imagePath, required this.text});

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(localization!.recognizedText),
        backgroundColor: Theme.of(context).primaryColorDark,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: SingleChildScrollView(
        child: Row(
          children: [
            SizedBox(
              width: 40,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 100 * 75,
                        child: Image.file(File(imagePath)),
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
                  ),

                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(onPressed: (){context.go("/home/takePicture");}, child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.camera_alt),
                          Text("Capture Again"),
                        ],
                      ) ,
                      ),

                       ElevatedButton(
                        onPressed: (){
                          context.goNamed('SearchWithTextScreen', params: {'text': this.text});
                        },
                        child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.search),
                          Text("Search With Recognized Text"),
                        ],
                      )),

                    ],
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
