import 'package:flutter/material.dart';
import 'package:vantra_app/constants/colors.dart';
import 'package:vantra_app/constants/regex.dart';
import 'package:vantra_app/widgets/custom_textformfield.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();

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
                Text("WELCOME!", 
                    style: TextStyle(color: AppColors.white, fontSize: 26)),
                const SizedBox(height: 20),
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
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                 

                 
                    }
                  },
                  child: const Text("Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
