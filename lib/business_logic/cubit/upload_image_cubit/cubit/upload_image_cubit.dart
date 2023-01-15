import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_app_project/screens/edit_profile/widgets/profile_image.dart';

part 'upload_image_state.dart';

class UploadImageCubit extends Cubit<UploadImageState> {
  UploadImageCubit()
      : super(UploadImageState(status: UploadImageStatus.initialState));

  Future uploadImage() async {
    //ImageSource gallery
    try {
      final ImagePicker picker = ImagePicker();
      emit(UploadImageState(status: UploadImageStatus.choosingImage));
      XFile? img = await picker.pickImage(source: ImageSource.gallery);
      // print("asddvfbsnyjjtrsfdnrthyujnghfgxdsz");
      // print(img?.path);
      emit(UploadImageState(
          status: UploadImageStatus.uploadSuccessful, image: img));
    } on Exception catch (e) {
      emit(UploadImageState(
          status: UploadImageStatus.uploadFailure, message: e.toString()));
    }
  }

  resetImage() {
    emit(UploadImageState(status: UploadImageStatus.initialState, image: null));
  }
}
