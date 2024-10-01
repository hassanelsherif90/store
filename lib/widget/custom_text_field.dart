import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField(
      {this.onChange,
      this.hintText,
      this.obscureText = false,
      this.inputType,
      super.key});

  final String? hintText;
  TextInputType? inputType;

  Function(String)? onChange;
  bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      onChanged: onChange,
      keyboardType: inputType,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(),
          borderRadius: BorderRadius.circular(8),
        ),
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: const BorderSide(),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
