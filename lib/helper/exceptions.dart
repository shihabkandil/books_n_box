class GoogleSignInFailure implements Exception {
  final String message;
  const GoogleSignInFailure([this.message = "Failed to Sign In with google"]);

  factory GoogleSignInFailure.fromCode(String code){
    switch (code) {
      case 'invalid-credential':
        return const GoogleSignInFailure(
          'The credential received is malformed or has expired.',
        );
      case 'operation-not-allowed':
        return const GoogleSignInFailure(
          'Operation is not allowed.  Please contact support.',
        );
      case 'user-disabled':
        return const GoogleSignInFailure(
          'This user has been disabled. Please contact support for help.',
        );
      default:
        return const GoogleSignInFailure();
    }
  }
}