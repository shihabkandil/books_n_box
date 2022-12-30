import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mlkit_commons/google_mlkit_commons.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:mobile_app_project/business_logic/cubit/camera_cubit/camera_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
  InputImage? inputImage;
  Future<XFile>? pickedFile;
  String? error;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CameraCubit>(context).getImage().catchError((e) {
      print(e);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocListener<CameraCubit, CameraState>(
        listener: (context, state) {
          if (state.status == cameraStatus.hasImage) {
            context.go('/home/takePicture/textRecognizer',
                extra: state.imagePath); //takePicture/textRecognizer
          }
        },
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                localization!.loading + '' + localization.camera,
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
              SizedBox(
                height: 20,
              ),
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
