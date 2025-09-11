import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final String? Function(String?)? validator;
  final String label;

  const CustomTextField({
    this.label = "",
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      borderSide: const BorderSide(color: Colors.white, width: 0.49),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 2.0),
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        TextFormField(
          cursorColor: Colors.black,
          controller: controller,
          obscureText: obscureText,
          validator: validator,
          style: const TextStyle(color: Colors.black87),
          decoration: InputDecoration(
            
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.white.withOpacity(0.82)),
            filled: true,
            fillColor: const Color(0xFFB3C09B).withOpacity(0.9),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            border: border,
            enabledBorder: border,
            focusedBorder: border.copyWith(
              borderSide: const BorderSide(color: Colors.white, width: 1),
            ),
            errorBorder: border.copyWith(
              borderSide: const BorderSide(color: Colors.red, width: 1),
            ),
            focusedErrorBorder: border.copyWith(
              borderSide: const BorderSide(color: Colors.red, width: 1),
            ),
          ),
        ),
      ],
    );
  }
}
