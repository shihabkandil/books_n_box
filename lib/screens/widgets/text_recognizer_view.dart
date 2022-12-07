import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:mobile_app_project/business_logic/cubit/text_recognition_cubit.dart';
import 'package:mobile_app_project/screens/widgets/display_picture.dart';

class TextRecognizerView extends StatefulWidget {
  // TextRecognizerView({super.key, required this.imagePath});
  TextRecognizerView({super.key, required this.inputImage});
  // InputImage? inputImage;
  // final String imagePath;
  final inputImage;
  @override
  State<TextRecognizerView> createState() => _TextRecognizerViewState();
}

class _TextRecognizerViewState extends State<TextRecognizerView> {
  bool _canProcess = true;
  // bool _isBusy = false;
  // CustomPaint? _customPaint;
  String _text = '';
  InputImage? inputImage;
  Future<RecognizedText?>? recognizedTextFuture;

  @override
  void dispose() {
    _canProcess = false;

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // inputImage = InputImage.fromFilePath(widget.imagePath);
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<TextRecognitionCubit>(context)
        .processImage(inputImage)
        .catchError((error) => Text(error));
    return BlocListener<TextRecognitionCubit, TextRecognitionState>(
      listener: (context, state) {
        
        if (state.status == TextRecognitionStatus.successful) {
          if (state.recognizedText != null) {
            this._text = state.recognizedText!.text;
            context.goNamed('DisplayPictureScreen', extra: this._text);
                // params: {'imagePath': widget.imagePath, 'text': this._text});
                
          }
        } 
      },
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );

  }
}
