import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app_project/helper/exceptions.dart';
import '../../../data/repository/auth_repository.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;

  AuthCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const AuthState(status: AuthenticationStatus.initialState));

  Future<void> logInWithGoogle() async {
    try {
      await _authRepository.logInWithGoogle();
      emit(const AuthState(status: AuthenticationStatus.googleSignInSuccess));
    }
    on GoogleSignInFailure catch(e){
      emit(AuthState(status: AuthenticationStatus.googleSignInFailure,message: e.message));
    }
  }

  Future<void> loginWithEmailAndPassword({required String email, required String password}) async {
    try{
      await _authRepository.loginWithEmailPassword(email: email, password: password);
      emit(AuthState(status: AuthenticationStatus.emailLoginSuccess));
    }
    on FirebaseAuthFailure catch(exception){
      emit(AuthState(status: AuthenticationStatus.emailLoginFailure,message: exception.message));
    }
  }


  Future<void> registerEmailAccount({required String email, required String confirmedPassword}) async {
    try{
      await _authRepository.registerEmailAccount(email: email, confirmedPassword: confirmedPassword);
      emit(AuthState(status: AuthenticationStatus.emailRegisterSuccess));
    }
    on FirebaseAuthFailure catch(exception){
      emit(AuthState(status: AuthenticationStatus.emailRegisterFailure,message: exception.message));
    }
  }

  Future<void> logOut() async {
    await _authRepository.logOut();
    emit(AuthState(status: AuthenticationStatus.loggedOut));
  }

  @override
  void onChange(Change<AuthState> change) {
    super.onChange(change);
    debugPrint(change.toString());
  }

}
