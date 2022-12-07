part of 'camera_cubit.dart';

enum cameraStatus { initialState, hasImage }

class CameraState extends Equatable {
  CameraState({this.imagePath, required this.status, this.error});
  String? imagePath = '';
  final cameraStatus status;
  String? error;

  @override
  List<Object> get props => [this.status];
}

// class CameraInitial extends CameraState {}
