import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../core/widget/custom_button.dart';
import '../../../../core/widget/custom_textfield.dart';
import '../../../auth/domain/repositories/auth.dart';
import '../../data/repositories/email_auth.dart';

class ForgetPass extends StatelessWidget {
  static const String route = '/ForgetPass';

  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  ForgetPass({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthRepository authRepository =
        EmailAuthService(FirebaseAuth.instance); // Inject FirebaseAuth

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Reset Password',
                style: TextStyle(color: Colors.white, fontSize: 28),
              ),
              const SizedBox(height: 20),
              CustomTextfield(
                controller: emailController,
                hintText: 'Enter your email',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!value.contains('@') || !value.contains('.')) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              CustomButton(
                buttonText: 'Send Reset Email',
                backColor: Colors.blue,
                foreColor: Colors.white,
                bonPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      await authRepository.sendPasswordResetEmail(
                        emailController.text.trim(),
                      );

                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.success,
                        animType: AnimType.rightSlide,
                        title: 'Success',
                        desc:
                            'Password reset email sent. Check your inbox, spam, or promotions folder!',
                      ).show();
                    } on FirebaseAuthException catch (e) {
                      String message;
                      switch (e.code) {
                        case 'invalid-email':
                          message = 'The email address is not valid.';
                          break;
                        case 'user-not-found':
                          message = 'No user found for this email.';
                          break;
                        case 'too-many-requests':
                          message =
                              'Too many attempts. Please try again later.';
                          break;
                        default:
                          message = e.message ?? 'An unknown error occurred.';
                      }

                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.rightSlide,
                        title: 'Error',
                        desc: message,
                      ).show();
                    } catch (e) {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.rightSlide,
                        title: 'Error',
                        desc: 'Unexpected error: ${e.toString()}',
                      ).show();
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
