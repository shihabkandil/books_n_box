import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
part 'text_recognition_state.dart';

class TextRecognitionCubit extends Cubit<TextRecognitionState> {
  TextRecognitionCubit()
      : super(TextRecognitionState(status: TextRecognitionStatus.initialState));

  final TextRecognizer _textRecognizer =
      TextRecognizer(script: TextRecognitionScript.latin);

  Future<void> processImage(inputImage) async {
    try {
      final text = await _textRecognizer.processImage(inputImage);
      _textRecognizer.close();
      emit(TextRecognitionState(
          status: TextRecognitionStatus.successful, recognizedText: text));
    } catch (e) {
      print(e);
    }
  }
}
