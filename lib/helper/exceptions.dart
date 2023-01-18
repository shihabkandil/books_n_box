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

class FirebaseAuthFailure implements Exception{
  final String message;
  const FirebaseAuthFailure([this.message = "Authentication Failure"]);

  factory FirebaseAuthFailure.fromCode(String code){
    switch (code) {
      case 'invalid-credential':
        return const FirebaseAuthFailure(
          'The credential received is malformed or has expired.',
        );
      case 'email-already-in-use':
        return const FirebaseAuthFailure(
          'Email already in use',
        );
      case 'wrong-password':
        return const FirebaseAuthFailure(
          'Wrong email/password combination.',
        );
        case 'user-not-found':
        return const FirebaseAuthFailure(
          'No user found with this email.',
        );
        case 'User disabled.':
        return const FirebaseAuthFailure(
          'User Disabled',
        );
        case 'operation-not-allowed':
        return const FirebaseAuthFailure(
          'Too many requests to log into this account.',
        );
      default:
        return const FirebaseAuthFailure();
    }
  }
}

class ImageUploadFailure implements Exception {
  final String message;
  const ImageUploadFailure([this.message = "Profile Update Failure"]);

  factory ImageUploadFailure.fromCode(String code) {
    switch (code) {
      case 'storage/object-not-found':
        return const ImageUploadFailure(
          'Image not found',
        );
      case 'storage/unauthenticated':
        return const ImageUploadFailure(
          'Please log in and try again',
        );
      case 'storage/invalid-url':
        return const ImageUploadFailure(
          'Unable to delete old image.',
        );
      case 'storage/invalid-checksum':
        return const ImageUploadFailure(
          'Checksum error, please try uploading again',
        );
      case 'storage/retry-limit-exceeded':
        return const ImageUploadFailure(
          'Time limit exceeded, please try again',
        );
      default:
        return const ImageUploadFailure();
    }
  }
}
