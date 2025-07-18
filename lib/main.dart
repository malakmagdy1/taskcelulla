import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:task/features/auth/presentation/screens/forget_pass.dart';
import 'package:task/features/auth/presentation/screens/homeScreen.dart';
import 'package:task/features/auth/presentation/screens/loginScreen.dart';
import 'package:task/features/auth/presentation/screens/signinScreen.dart';

import 'core/widget/constant/colors.dart';
import 'features/home/presentation/home_screen.dart';
import 'firebase_options.dart';

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
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: FirebaseAuth.instance.currentUser == null
          ? 'HomeScreen'
          : 'HomeScreen2',
      routes: {
        'HomeScreen': (context) => HomeSreen(),
        'LoginScreen': (context) => LoginScreen(),
        'SignInScreen': (context) => SignInscreen(),
        "HomeScreen2": (context) => HomeSreen2(),
        "ForgetPass": (context) => ForgetPass(),
      },
    );
  }
}
