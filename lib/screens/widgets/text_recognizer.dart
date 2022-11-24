import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:mobile_app_project/screens/widgets/display_picture.dart';

class TextRecognizerView extends StatefulWidget {
  TextRecognizerView({super.key, required this.imagePath});
  // InputImage? inputImage;
  String imagePath;
  @override
  State<TextRecognizerView> createState() => _TextRecognizerViewState();
}

class _TextRecognizerViewState extends State<TextRecognizerView> {
  final TextRecognizer _textRecognizer =
      TextRecognizer(script: TextRecognitionScript.latin);
  bool _canProcess = true;
  bool _isBusy = false;
  CustomPaint? _customPaint;
  String? _text;

  @override
  void dispose() async {
    _canProcess = false;
    _textRecognizer.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final inputImage = InputImage.fromFilePath(widget.imagePath);
    processImage(inputImage);
    return DisplayPictureScreen(
      imagePath: widget.imagePath,
      text: this._text!,
    );
  }

  Future<void> processImage(InputImage inputImage) async {
    if (!_canProcess) return;
    if (_isBusy) return;
    _isBusy = true;
    setState(() {
      _text = '';
    });
    if (inputImage.bytes == null) {
      // print("null image");
    }
    final recognizedText = await _textRecognizer.processImage(inputImage);
    if (inputImage.inputImageData?.size != null &&
        inputImage.inputImageData?.imageRotation != null) {
      // final painter = TextRecognizerPainter(
      //     recognizedText,
      //     inputImage.inputImageData!.size,
      //     inputImage.inputImageData!.imageRotation);
      // _customPaint = CustomPaint(painter: painter);
      // print(recognizedText.toString());
    } else {
      _text = 'Recognized text:\n${recognizedText.text}';
      // TODO: set _customPaint to draw boundingRect on top of image
      print(_text!);
      _customPaint = null;
    }
    _isBusy = false;
    // if (mounted) {
    //   setState(() {});
    // }
  }
}
