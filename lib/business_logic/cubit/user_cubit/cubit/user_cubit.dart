import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../data/models/user.dart' as User;
import '../../../../data/repository/user_repository.dart';
import '../../../../helper/exceptions.dart';
import '../../../../utils/enums/profile_enum.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit({UserRepository? userRepository})
      : _userRepository = userRepository ?? UserRepository(),
        super(UserState(status: ProfileStatus.initialState));

  final UserRepository _userRepository;

  Future<void> UpdateProfile(
      {String? name,
      String? pass,
      String? email,
      String? imageURL,
      String? currentPass}) async {
    try {
      await _userRepository.updateProfile(
          currentPass: currentPass,
          name: name,
          email: email,
          pass: pass,
          imageURL: imageURL);

      emit(UserState(status: ProfileStatus.profileUpdateSuccess));
    } on FirebaseAuthFailure catch (exception) {
      emit(UserState(
          status: ProfileStatus.reauthenticationFailure,
          message: exception.message));
    } on ImageUploadFailure catch (e) {
      emit(UserState(
          status: ProfileStatus.imageUploadFailed, message: e.message));
    } catch (ex) {
      emit(UserState(
          status: ProfileStatus.profileUpdateFailure,
          message: "Update Profile Failed"));
    }
  }
}
