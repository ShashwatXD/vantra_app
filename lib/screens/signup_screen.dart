import 'package:flutter/material.dart';
import 'package:vantra_app/constants/app_routes.dart';
import 'package:vantra_app/constants/colors.dart';
import 'package:vantra_app/constants/regex.dart';
import 'package:vantra_app/widgets/custom_textformfield.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();
  final TextEditingController confirmPassCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryGreen,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text("CREATE ACCOUNT",
                    style: TextStyle(color: AppColors.white, fontSize: 26)),
                const SizedBox(height: 20),

                // Name
                CustomTextField(
                  controller: nameCtrl,
                  hintText: "Full Name",
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return "Enter your name";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                CustomTextField(
                  controller: emailCtrl,
                  hintText: "Email-id",
                  validator: (val) {
                    if (!RegexConstants.emailRegex.hasMatch(val ?? "")) {
                      return "Enter valid email";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Password
                CustomTextField(
                  controller: passCtrl,
                  hintText: "Password",
                  obscureText: true,
                  validator: (val) {
                    if (!RegexConstants.passwordRegex.hasMatch(val ?? "")) {
                      return "Password must contain A-Z, a-z, 0-9";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Confirm Password
                CustomTextField(
                  controller: confirmPassCtrl,
                  hintText: "Confirm Password",
                  obscureText: true,
                  validator: (val) {
                    if (val != passCtrl.text) {
                      return "Passwords do not match";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Signup Button
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Signup Successful (Demo)")),
                      );
                      Navigator.pushReplacementNamed(context, AppRoutes.login);
                    }
                  },
                  child: const Text("Sign Up"),
                ),
                const SizedBox(height: 16),

                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, AppRoutes.login);
                  },
                  child: const Text(
                    "Already have an account? Login",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
