import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_commons/google_mlkit_commons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_app_project/screens/widgets/text_recognizer.dart';
import '/main.dart';
import 'dart:async';

// A screen that allows users to take a picture using a given camera.
class TakePictureScreen extends StatefulWidget {
  TakePictureScreen({
    super.key,
  });

  final CameraDescription camera = firstCamera!;

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController? _controller;
  InputImage? inputImage;
  String? _path;
  ImagePicker? _imagePicker;
  // File? _image;

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.high,
      enableAudio: false,
    );

    _imagePicker = ImagePicker();
    takeImage();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    // _controller?.stopImageStream();
    _controller?.dispose();
    super.dispose();
  }

  void takeImage() async {
    // Take the Picture in a try / catch block. If anything goes wrong,
    // catch the error.
    try {
      final pickedFile =
          await _imagePicker?.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        _processXFile(pickedFile);
      }
    } catch (e) {
      // If an error occurs, log the error to the console.
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (inputImage == null || _path == null) {
      return Container();
    }
    return TextRecognizerView(imagePath: _path!);
  }

  Future _processXFile(XFile? pickedFile) async {
    final path = pickedFile?.path;
    if (path == null) {
      return;
    }
    setState(() {
      _path = path;
      inputImage = InputImage.fromFilePath(path);
    });
  }
}
