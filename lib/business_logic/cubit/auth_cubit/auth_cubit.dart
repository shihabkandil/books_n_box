import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/user.dart';
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
      if(!isNewAccount){
        _authRepository.saveFireStoreUser(user);
      }
      emit(const AuthState(status: AuthenticationStatus.googleSignInSuccess));
    }
    on GoogleSignInFailure catch(e){
      emit(AuthState(status: AuthenticationStatus.googleSignInFailure,message: e.message));
    }
    catch(error){
      emit(AuthState(status: AuthenticationStatus.googleSignInFailure,));
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


  Future<void> registerEmailAccount({required String email, required String confirmedPassword,required String username}) async {
    try{
      await _authRepository.registerEmailAccount(email: email, confirmedPassword: confirmedPassword);
      final user = await _authRepository.user.first;
      _authRepository.saveFireStoreUser(user.copyWith(name: username));
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

  void setUserRemember({required bool isRemembered}){
    _authRepository.setUserRememberMe(isRemembered: isRemembered);
  }

  Future<void> resetPassword({String? email}) async {
    if(email != null && email.isNotEmpty){
      try {
        await _authRepository.resetUserPasswordWithEmail(email);
        emit(AuthState(status: AuthenticationStatus.resetEmailSentSuccessfully));
      }
      catch(error){
        emit(AuthState(status: AuthenticationStatus.resetEmailSendFailed));
      }
    }
    else{
      emit(AuthState(status: AuthenticationStatus.resetEmailNotValid));
    }
  }

  @override
  void onChange(Change<AuthState> change) {
    super.onChange(change);
    debugPrint(change.toString());
  }

}
