import 'package:exam_file/views/screens/auth/login_screen.dart';
import 'package:exam_file/views/screens/home_screen.dart';
import 'package:exam_file/views/screens/identification_screen.dart';
import 'package:exam_file/views/screens/payment_screen.dart';
import 'package:exam_file/views/screens/profile_screen.dart';
import 'package:exam_file/views/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        "/": (context) => const SplashScreen(),
        "/login": (context) => const LoginScreen(),
        "/home": (context) => const HomeScreen(),
        "/profile": (context) => const ProfileScreen(),
        "/identification": (context) => const IdentificationScreen(),
      },
    );
  }
}