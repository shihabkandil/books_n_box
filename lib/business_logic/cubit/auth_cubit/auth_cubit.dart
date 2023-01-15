import 'dart:async';
import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_app_project/business_logic/cubit/upload_image_cubit/cubit/upload_image_cubit.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../data/models/user.dart' as User;
import '../../../data/repository/auth_repository.dart';
import '../../../helper/exceptions.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;

  AuthCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const AuthState(status: AuthenticationStatus.initialState));

  Future<void> logInWithGoogle() async {
    try {
      await _authRepository.logInWithGoogle();
      final user = await _authRepository.user.first;
      final isNewAccount = await _authRepository.isNewAccount(user.id);
      if (!isNewAccount) {
        _authRepository.saveFireStoreUser(user);
      }
      emit(const AuthState(status: AuthenticationStatus.googleSignInSuccess));
    } on GoogleSignInFailure catch (e) {
      emit(AuthState(
          status: AuthenticationStatus.googleSignInFailure,
          message: e.message));
    } catch (error) {
      emit(AuthState(
        status: AuthenticationStatus.googleSignInFailure,
      ));
    }
  }

  Future<void> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _authRepository.loginWithEmailPassword(
          email: email, password: password);
      emit(AuthState(status: AuthenticationStatus.emailLoginSuccess));
    } on FirebaseAuthFailure catch (exception) {
      emit(AuthState(
          status: AuthenticationStatus.emailLoginFailure,
          message: exception.message));
    }
  }

  Future<void> registerEmailAccount(
      {required String email,
      required String confirmedPassword,
      required String username,
      String? imageUrl}) async {
    try {
      await _authRepository.registerEmailAccount(
          email: email,
          confirmedPassword: confirmedPassword,
          displayName: username,
          imageUrl: imageUrl);

      final user = await _authRepository.user.first;
      print(user.copyWith(name: username));
      _authRepository.saveFireStoreUser(user.copyWith(name: username));
      emit(AuthState(status: AuthenticationStatus.emailRegisterSuccess));
    } on FirebaseAuthFailure catch (exception) {
      emit(AuthState(
          status: AuthenticationStatus.emailRegisterFailure,
          message: exception.message));
    }
  }

  Future<void> logOut() async {
    await _authRepository.logOut();
    emit(AuthState(status: AuthenticationStatus.loggedOut));
  }
  
  Future<void> UpdateProfile(
      {String? name,
      String? pass,
      String? email,
      String? imageURL,
      required String? currentPass}) async {
    try {
      final user = await FirebaseAuth.instance.currentUser;
      String? message;
      if (user == null) {
        throw FirebaseAuthFailure;
      }
      // print(name);
      if (name != null && name.isNotEmpty) {
        await user.updateDisplayName(name);
      }

      if (email != null && email.isNotEmpty && email != user.email) {
        await user.verifyBeforeUpdateEmail(email);
        // await user.updateEmail(email);
      }

      if (pass != null && pass.isNotEmpty) {
        await user.reauthenticateWithCredential(EmailAuthProvider.credential(
            email: user.email!, password: currentPass ?? ''));
        await user.updatePassword(pass);
      }

      print(imageURL);
      if (imageURL != null &&
          imageURL.isNotEmpty &&
          imageURL != user.photoURL) {
        String? saved = await _authRepository.saveImage(imageURL, user.photoURL);
        if (saved != null) {
          await user.updatePhotoURL(saved);
        }
      }
      emit(AuthState(
          status: AuthenticationStatus.profileUpdateSuccess, message: message));
    } on FirebaseAuthFailure catch (exception) {
      emit(AuthState(
          status: AuthenticationStatus.profileUpdateFailure,
          message: exception.message));
    } on FirebaseAuthException catch (ex) {
      emit(AuthState(
          status: AuthenticationStatus.reauthenticationFailure,
          message: ex.message));
    }
  }

  Future<void> resetPassword({String? email}) async {
    if (email != null && email.isNotEmpty) {
      try {
        await _authRepository.resetUserPasswordWithEmail(email);
        emit(
            AuthState(status: AuthenticationStatus.resetEmailSentSuccessfully));
      } catch (error) {
        emit(AuthState(status: AuthenticationStatus.resetEmailSendFailed));
      }
    } else {
      emit(AuthState(status: AuthenticationStatus.resetEmailNotValid));
    }
  }

  @override
  void onChange(Change<AuthState> change) {
    super.onChange(change);
    debugPrint(change.toString());
  }
}
