part of 'text_recognition_cubit.dart';

enum TextRecognitionStatus { initialState, successful, error }

class TextRecognitionState extends Equatable {
  const TextRecognitionState({required this.status, this.message,this.recognizedText});
  final TextRecognitionStatus status;
  final String? message;
  final RecognizedText? recognizedText;

  @override
  List<Object> get props => [status];
}

// class TextRecognitionInitial extends TextRecognitionState {}
