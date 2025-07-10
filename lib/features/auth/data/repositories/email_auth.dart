import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/helpers/auth_handler.dart';
import '../../domain/repositories/auth.dart';

class EmailAuthService implements AuthRepository {
  final FirebaseAuth _firebaseAuth;

  EmailAuthService(this._firebaseAuth);

  @override
  Future<User> logIn({
    User? initialUser,
    String? email,
    String? password,
  }) async {
    assert(initialUser != null || (email != null && password != null),
        'You must provide either an initial user or email/password.');

    try {
      final User? user = initialUser ??
          (await _firebaseAuth.signInWithEmailAndPassword(
            email: email!,
            password: password!,
          ))
              .user;

      if (user == null) {
        throw AuthResultStatus.undefined;
      }

      return user;
    } on FirebaseAuthException catch (e) {
      throw AuthExceptionHandler.handleException(e);
    } catch (_) {
      throw AuthResultStatus.undefined;
    }
  }

  @override
  Future<User> signUp({
    String? email,
    String? password,
  }) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );

      final user = userCredential.user;

      if (user == null) {
        throw AuthResultStatus.undefined;
      }

      return user;
    } on FirebaseAuthException catch (e) {
      throw AuthExceptionHandler.handleException(e);
    } catch (_) {
      throw AuthResultStatus.undefined;
    }
  }

  @override
  Future<void> sendEmailVerification() async {
    await _firebaseAuth.currentUser?.sendEmailVerification();
  }

  @override
  Future<void> logOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }
}
