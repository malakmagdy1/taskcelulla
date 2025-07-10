// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
// import 'package:google_sign_in/google_sign_in.dart';
//
// import '../../domain/repositories/auth.dart';
// import '../models/user_account.dart';
//
// const List<String> googleScopes = <String>[
//   'email',
//   'https://www.googleapis.com/auth/contacts.readonly',
// ];
//
// const String googleClientId = '<google-client-id>.apps.googleusercontent.com';
//
// class GoogleAuthService implements AuthRepository {
//   final FirebaseAuth _firebaseAuth;
//
//   GoogleAuthService(this._firebaseAuth);
//
//   GoogleSignIn _googleSignIn = GoogleSignIn(
//     clientId: googleClientId,
//     scopes: googleScopes,
//   );
//
//   Future<AuthHttpResponse> logIn({
//     User? initialUser,
//     String? email,
//     String? password,
//   }) async {
//     try {
//       User user = initialUser ?? await _handleSignIn();
//
//       return AuthHttpSuccess(
//         data: UserAccountModel.fromUserCredentials(
//           user.uid,
//           user,
//           AuthType.Google,
//         ),
//       );
//     } on FirebaseAuthException catch (e) {
//       return AuthHttpFailure(
//         status: AuthExceptionHandler.handleException(e),
//       );
//     } catch (_) {
//       return AuthHttpFailure(
//         status: AuthResultStatus.undefined,
//       );
//     }
//   }
//
//   Future<User> _handleSignIn() async {
//     if (kIsWeb) {
//       final UserCredential userCredential = await _firebaseAuth.signInWithPopup(GoogleAuthProvider());
//       return userCredential.user!;
//     } else {
//       final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
//
//       final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
//
//       /// Interrupted
//       if (googleAuth?.accessToken == null || googleAuth?.idToken == null) {
//         throw FirebaseAuthException(
//           code: 'login-interrupted',
//         );
//       }
//
//       final OAuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth?.accessToken,
//         idToken: googleAuth?.idToken,
//       );
//
//       final UserCredential userCredential = await _firebaseAuth.signInWithCredential(credential);
//       return userCredential.user!;
//     }
//   }
//
//   Future  signUp({
//     String? email,
//     String? password,
//   }) async {
//     throw UnimplementedError();
//   }
//
//   Future<void> sendEmailVerification() async {
//     await _firebaseAuth.currentUser?.sendEmailVerification();
//   }
//
//   Future<void> logOut() async {
//     if (!kIsWeb) {
//       await _googleSignIn.signOut();
//     }
//     await _firebaseAuth.signOut();
//   }
// }
