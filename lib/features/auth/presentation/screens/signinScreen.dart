import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/validator/auth_validator.dart';
import '../../../../core/widget/constant/colors.dart';
import '../../../../core/widget/constant/custom_show_dialog.dart';
import '../../../../core/widget/constant/text.dart';
import '../../../../core/widget/custom_button.dart';
import '../../../../core/widget/custom_textfield.dart';
import '../../../data/repositories/email_auth_service.dart';
import '../../data/repositories/email_auth.dart';
import '../../domain/repositories/auth.dart';

class SignInscreen extends StatefulWidget {
  static const String route = '/SignInScreen';

  const SignInscreen({super.key});

  @override
  State<SignInscreen> createState() => _SignInscreenState();
}

class _SignInscreenState extends State<SignInscreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController name = TextEditingController();
  final PageController pageController = PageController(initialPage: 0);
  final auth = Authentication();

  final AuthRepository _authRepository =
      EmailAuthService(FirebaseAuth.instance);

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: SizedBox(
              height: mediaQuery.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("SIGN UP",
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  const SizedBox(height: 5),
                  Text("CREATE AN ACCOUNT TO MAKE SDFSDF",
                      style: TextStyle(fontSize: 15, color: Colors.white)),
                  SizedBox(height: mediaQuery.height * 0.1),
                  textFormfield('FULL NAME'),
                  CustomTextfield(
                    key: const Key('nameField'),
                    controller: name,
                    hintText: 'Enter your name',
                    validator: auth.validateUserName,
                  ),
                  textFormfield('Email'),
                  CustomTextfield(
                      key: const Key('emailField'),
                      controller: email,
                      hintText: 'Enter your email',
                      validator: auth.validateUserEmail),
                  textFormfield('Password'),
                  CustomTextfield(
                      key: const Key('passwordField'),
                      controller: password,
                      hintText: 'Enter your password',
                      validator: auth.validatePassword),
                  SizedBox(
                    height: mediaQuery.height * 0.03,
                    child: SmoothPageIndicator(
                      controller: pageController,
                      count: 3,
                      effect: WormEffect(
                        dotColor: Colors.white.withOpacity(0.5),
                        activeDotColor: Colors.white,
                        dotHeight: mediaQuery.height * 0.012,
                        dotWidth: mediaQuery.width * 0.025,
                        spacing: mediaQuery.width * 0.015,
                      ),
                    ),
                  ),
                  CustomButton(
                    key: const Key('submitButton'),
                    buttonText: 'Next',
                    backColor: Colors.blue,
                    foreColor: Colors.white,
                    bonPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        try {
                          await _authRepository.signUp(
                            email: email.text.trim(),
                            password: password.text.trim(),
                          );
                          Navigator.of(context)
                              .pushReplacementNamed("StartScreen");
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            showCustomDialog(context, 'Error',
                                'The password provided is too weak.');
                          } else if (e.code == 'email-already-in-use') {
                            showCustomDialog(context, 'Error',
                                'The account already exists for that email.');
                          } else {
                            showCustomDialog(context, 'Error',
                                'Something went wrong. ${e.message}');
                          }
                        } catch (e) {
                          showCustomDialog(
                              context, 'Error', 'Unexpected error occurred.');
                        }
                      }
                    },
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "ALREADY HAVE AN ACCOUNT?",
                      style: TextStyle(color: textFiledColor, fontSize: 12),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
