import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future signUp({
    String? email,
    String? password,
  });

  Future logIn({
    User? initialUser,
    String? email,
    String? password,
  });

  Future<void> sendEmailVerification();

  Future<void> sendPasswordResetEmail(String email);

  Future<void> logOut();
}
