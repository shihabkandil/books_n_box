import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
part 'camera_state.dart';

class CameraCubit extends Cubit<CameraState> {
  CameraCubit() : super(CameraState(status: cameraStatus.initialState));

  ImagePicker? _imagePicker;

  Future<void> getImage() async {
    _imagePicker = ImagePicker();
    final image = await _imagePicker!.pickImage(source: ImageSource.camera);
    if (image != null) {
      String _path = image.path;
      emit(CameraState(imagePath: _path, status: cameraStatus.hasImage));
    }
  }
}
