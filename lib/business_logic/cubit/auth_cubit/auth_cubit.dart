import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      required String username}) async {
    try {
      await _authRepository.registerEmailAccount(
          email: email, confirmedPassword: confirmedPassword, name: username);
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

      if (imageURL != null && imageURL.isNotEmpty) {
        await user.updatePhotoURL(imageURL);
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

  void setUserRemember({required bool isRemembered}) {
    _authRepository.setUserRememberMe(isRemembered: isRemembered);
  }

  @override
  void onChange(Change<AuthState> change) {
    super.onChange(change);
    debugPrint(change.toString());
  }
}
