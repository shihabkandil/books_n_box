import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mlkit_commons/google_mlkit_commons.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_app_project/business_logic/cubit/camera_cubit.dart';
import 'package:mobile_app_project/business_logic/cubit/text_recognition_cubit.dart';
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
  CameraController? _controller;
  InputImage? inputImage;
  Future<XFile>? pickedFile;
  // ImagePicker? _imagePicker;
  String? error;

  @override
  void initState() {
    super.initState();
    // print("kkkkkkkkkkkkkkkkkkkk");
    // To display the current output from the Camera,
    // create a CameraController.
    // _controller = CameraController(
    //   // Get a specific camera from the list of available cameras.
    //   widget.camera,
    //   // Define the resolution to use.
    //   ResolutionPreset.high,
    //   enableAudio: false,
    // );
    // initializeCamera();
    // _imagePicker = ImagePicker();
  }

  // void initializeCamera() async {
  //   try {
  //     await _controller!.initialize();
  //   } catch (e) {
  //     error = e.toString();
  //   }
  // }

  @override
  void dispose() {
    // _controller?.stopImageStream();
    // // Dispose of the controller when the widget is disposed.
    // _controller?.dispose();
    // _controller = null;
    // _textRecognizer.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print("here");
    BlocProvider.of<CameraCubit>(context)
        .getImage()
        .catchError((error) => Text(error));
    return BlocListener<CameraCubit, CameraState>(
        listener: (context, state) {
          if (state.status == cameraStatus.hasImage) {
            // BlocProvider(
            //   create: (context) => TextRecognitionCubit(),
            //   child: TextRecognizerView(imagePath: state.imagePath!),
            // );
            context.go('/takePicture/textRecognizer',
                extra: state.imagePath); //home/takePicture/textRecognizer
          }
        },
        child: Center(
          child: Column(
            children: [
              Text('loading camera'),
              CircularProgressIndicator(),
            ],
          ),
        ));

    // return Scaffold(
    //   backgroundColor: Colors.black,
    //   body: FutureBuilder(
    //     builder: ((context, snapshot) {
    //       if (snapshot.hasData) {
    //         final _path = _processXFile(snapshot.data);
    //         if (_path != null) {
    //           return BlocProvider(
    //             create: (context) => TextRecognitionCubit(),
    //             child: TextRecognizerView(imagePath: _path),
    //           );
    //         }
    //       } else if (snapshot.hasError) {
    //         return Text(
    //           snapshot.error.toString(),
    //           style: TextStyle(fontSize: 18),
    //         );
    //       }
    //       return Center(
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Text(
    //               "Opening Camera",
    //               style: TextStyle(color: Colors.white, fontSize: 18),
    //             ),
    //             SizedBox(
    //               height: 20,
    //             ),
    //             CircularProgressIndicator(),
    //           ],
    //         ),
    //       );
    //     }),
    //     future: _imagePicker?.pickImage(source: ImageSource.camera),
    //   ),
    // );
  }

  String? _processXFile(XFile? pickedFile) {
    final path = pickedFile?.path;
    if (path == null) {
      return null;
    }
    inputImage = InputImage.fromFilePath(path);
    return path;
  }
}
