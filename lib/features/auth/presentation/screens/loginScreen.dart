import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task/core/widget/constant/colors.dart';
import 'package:task/core/widget/constant/custom_show_dialog.dart';
import 'package:task/core/widget/constant/text.dart';
import 'package:task/core/widget/custom_button.dart';
import 'package:task/core/widget/custom_textfield.dart';

import '../../../home/presentation/home_screen.dart';
import '../../data/repositories/email_auth.dart';
import '../../domain/repositories/auth.dart';

class LoginScreen extends StatefulWidget {
  static const String route = '/LoginScreen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final AuthRepository _authRepository =
      EmailAuthService(FirebaseAuth.instance);

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: SizedBox(
            height: mediaQuery.height, // ✅ Responsive height
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("LOGIN",
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  const SizedBox(height: 5),
                  Text("CREATE AN ACCOUNT TO MAKE SDFSDF",
                      style: TextStyle(fontSize: 15, color: Colors.white)),
                  SizedBox(height: mediaQuery.height * 0.15),
                  textFormfield('email'),
                  CustomTextfield(
                    controller: email,
                    hintText: 'Enter your email',
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return 'Please enter your email';
                      if (!value.contains('@') || !value.contains('.'))
                        return 'Enter a valid email';
                      return null;
                    },
                  ),
                  textFormfield('password'),
                  CustomTextfield(
                    controller: password,
                    hintText: 'Enter your password',
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return 'Please enter your password';
                      if (value.length < 6)
                        return 'Password must be at least 6 characters';
                      return null;
                    },
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, 'ForgetPass'),
                      child: Text("Forget your password?",
                          style:
                              TextStyle(color: textFiledColor, fontSize: 12)),
                    ),
                  ),
                  SizedBox(height: mediaQuery.height * 0.02),
                  CustomButton(
                    buttonText: 'LOGIN',
                    backColor: Colors.blue,
                    foreColor: Colors.white,
                    bonPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        try {
                          await _authRepository.logIn(
                            email: email.text.trim(),
                            password: password.text.trim(),
                          );

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeSreen2(
                                        emailTitle: email.text.trim(),
                                      )));
                        } on FirebaseAuthException catch (e) {
                          Future.microtask(() {
                            if (e.code == 'user-not-found') {
                              showCustomDialog(context, 'Error',
                                  'No user found for that email.');
                            } else if (e.code == 'wrong-password') {
                              showCustomDialog(context, 'Error',
                                  'Wrong password provided for that user.');
                            } else {
                              showCustomDialog(context, 'Error',
                                  'Authentication failed try again.\n${e.message}');
                            }
                          });
                        } catch (e) {
                          showCustomDialog(context, 'Error',
                              'Unexpected error: ${e.toString()}');
                        }
                      }
                    },
                  ),
                  SizedBox(height: mediaQuery.height * 0.02),
                  CustomButton(
                    buttonText: 'Login With Google',
                    backColor: Colors.white,
                    foreColor: mainColor,
                    bonPressed: () {
                      // You can later plug in Google Sign-In Use Case
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      // Optional: Navigate to sign-up screen
                    },
                    child: Text(
                      "DON'T HAVE AN ACCOUNT",
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
