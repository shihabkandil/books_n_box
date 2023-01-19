part of 'auth_cubit.dart';

enum AuthenticationStatus {
  initialState,
  googleSignInSuccess,
  googleSignInFailure,
  emailLoginSuccess,
  emailLoginFailure,
  loggedOut,
  emailRegisterSuccess,
  emailRegisterFailure,
  verifyMail,
  resetEmailSentSuccessfully,
  resetEmailSendFailed,
  resetEmailNotValid
}

class AuthState extends Equatable {
  const AuthState(
      {required this.status, this.message, this.user = User.User.empty});
  final AuthenticationStatus status;
  final String? message;
  final User.User user;
  @override
  List<Object> get props => [status];
}
