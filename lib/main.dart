import 'package:flutter/material.dart';
import 'package:vantra_app/constants/app_routes.dart';
import 'package:vantra_app/constants/colors.dart';
import 'package:vantra_app/screens/login_screen.dart';
import 'package:vantra_app/screens/signup_screen.dart';

void main() {
  runApp(const VantraApp());
}

class VantraApp extends StatelessWidget {
  const VantraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vantra',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primaryGreen,
        scaffoldBackgroundColor: AppColors.background,
      ),
      initialRoute: AppRoutes.login,
      routes: {
        AppRoutes.login: (context) => const LoginScreen(),
        AppRoutes.signup: (context) => const SignupScreen(),
      },
    );
  }
}
