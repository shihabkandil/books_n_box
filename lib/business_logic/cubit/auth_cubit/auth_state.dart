part of 'auth_cubit.dart';

enum AuthenticationStatus{
  initialState,
  googleSignInSuccess,
  googleSignInFailure,
  loginSuccess,
  loginFailure,
  loggedOut
}

class AuthState extends Equatable {
  const AuthState({required this.status,this.message});
  final AuthenticationStatus status;
  final String? message;

  @override
  List<Object> get props => [status];
}