import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:mobile_app_project/screens/widgets/display_picture.dart';

class TextRecognizerView extends StatefulWidget {
  TextRecognizerView({super.key, required this.imagePath});
  // InputImage? inputImage;
  final String imagePath;
  @override
  State<TextRecognizerView> createState() => _TextRecognizerViewState();
}

class _TextRecognizerViewState extends State<TextRecognizerView> {
  final TextRecognizer _textRecognizer =
      TextRecognizer(script: TextRecognitionScript.latin);
  bool _canProcess = true;
  // bool _isBusy = false;
  // CustomPaint? _customPaint;
  String _text = '';
  InputImage? inputImage;
  Future<RecognizedText>? recognizedText;

  @override
  void dispose() async {
    _canProcess = false;
    _textRecognizer.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    inputImage = InputImage.fromFilePath(widget.imagePath);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<RecognizedText>(
      future: _textRecognizer.processImage(inputImage!),
      builder: ((context, snapshot) {
        if (snapshot.hasData && _canProcess) {
          this._text = snapshot.data!.text;
          return DisplayPictureScreen(
            imagePath: widget.imagePath,
            text: this._text,
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
