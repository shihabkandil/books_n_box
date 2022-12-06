part of 'camera_cubit.dart';

enum cameraStatus { initialState, hasImage }

class CameraState extends Equatable {
  CameraState({this.imagePath, required this.status});
  String? imagePath = '';
  final cameraStatus status;

  @override
  List<Object> get props => [this.status];
}

// class CameraInitial extends CameraState {}
