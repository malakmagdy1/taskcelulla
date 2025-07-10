import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:task/features/auth/presentation/screens/forget_pass.dart';
import 'package:task/features/auth/presentation/screens/startScreen.dart';
import 'firebase_options.dart';

import 'core/widget/constant/colors.dart';
import 'package:task/features/auth/presentation/screens/homeScreen.dart';
import 'package:task/features/auth/presentation/screens/loginScreen.dart';
import 'package:task/features/auth/presentation/screens/signinScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: mainColor,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: FirebaseAuth.instance.currentUser == null
          ? 'HomeScreen'
          : 'StartScreen',
      routes: {
        'HomeScreen': (context) => HomeSreen(),
        'LoginScreen': (context) => LoginScreen(),
        'SignInScreen': (context) => SignInscreen(),
        "StartScreen": (context) => StartScreen(),
        "ForgetPass": (context) => ForgetPass(),
      },
    );
  }
}
