// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String text;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final void Function(String)? onSubmitted;
  const CustomTextField({
    Key? key,
    this.controller,
    required this.text,
    required this.textInputAction,
    required this.validator,
    this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => validator!(value!),
      textInputAction: textInputAction,
      onFieldSubmitted: onSubmitted,
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
