part of 'upload_image_cubit.dart';

enum UploadImageStatus {
  initialState,
  uploadSuccessful,
  uploadFailure,
  choosingImage
}

class UploadImageState extends Equatable {
  const UploadImageState({required this.status, this.image, this.message});
  final UploadImageStatus status;
  final XFile? image;
  final String? message;
  @override
  List<Object> get props => [status];
}

// class UploadImageInitial extends UploadImageState {}
