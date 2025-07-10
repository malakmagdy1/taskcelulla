import 'package:firebase_auth/firebase_auth.dart';

enum AuthResultStatus {
  invalidEmail,
  wrongPassword,
  invalidCredential,
  insufficientPermission,
  idTokenExpired,
  userNotFound,
  userDisabled,
  loginInterrupted,
  tooManyRequests,
  operationNotAllowed,
  emailAlreadyExists,
  undefined,
}

class AuthExceptionHandler {
  static AuthResultStatus handleException(FirebaseException e) {
    AuthResultStatus status;

    switch (e.code) {
      case "invalid-email":
        status = AuthResultStatus.invalidEmail;
        break;
      case "wrong-password":
        status = AuthResultStatus.wrongPassword;
        break;
      case "invalid-credential":
        status = AuthResultStatus.invalidCredential;
        break;
      case "insufficient-permission":
        status = AuthResultStatus.insufficientPermission;
        break;
      case "id-token-expired":
        status = AuthResultStatus.idTokenExpired;
        break;

      case "user-not-found":
        status = AuthResultStatus.userNotFound;
        break;
      case "too-many-requests":
        status = AuthResultStatus.tooManyRequests;
        break;
      case "operation-not-allowed":
        status = AuthResultStatus.operationNotAllowed;
        break;
      case "login-interrupted":
        status = AuthResultStatus.loginInterrupted;
        break;
      case "email-already-exists":
      case "email-already-in-use":
        status = AuthResultStatus.emailAlreadyExists;
        break;
      default:
        status = AuthResultStatus.undefined;
    }
    return status;
  }
}
