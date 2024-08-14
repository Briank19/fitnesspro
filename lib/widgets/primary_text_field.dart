import 'package:flutter/material.dart';

class PrimaryTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final Widget? label;
  final bool obsecureText;
  final Widget? suffix;
  final TextInputType textInputType;
  final Function(String)? onChanged;
  final String? Function(String?)? validator; // Add the validator parameter

  const PrimaryTextField({
    super.key,
    required this.controller,
    this.hintText,
    required this.obsecureText,
    this.label,
    this.suffix,
    this.textInputType = TextInputType.text,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      obscureText: obsecureText,
      onChanged: onChanged,
      validator: validator, // Use the validator parameter
      decoration: InputDecoration(
        label: label,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color(0xff989a95),
        ),
        suffixIcon: suffix,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 160, 160, 159),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(
            color: Color(0xff050505),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1,
          ),
        ),
      ),
    );
  }
}
