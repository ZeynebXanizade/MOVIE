// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  const CustomTextField({
    super.key,
    required this.text,
    required this.textInputAction,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => validator!(value!),
      textInputAction: textInputAction,
      decoration: InputDecoration(
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        disabledBorder: const OutlineInputBorder(),
        hintText: text,
        fillColor: const Color(0xFFFFFFFF),
        hintStyle: TextStyle(
          fontSize: 14.rt,
          fontWeight: FontWeight.w400,
        ),
      ),
      textAlign: TextAlign.start,
    );
  }
}
