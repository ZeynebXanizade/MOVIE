import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorOpacityAnimates: true,
      decoration: InputDecoration(
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          disabledBorder: const OutlineInputBorder(),
          hintText: 'Enter Password',
          fillColor: const Color(0xFFFFFFFF),
          hintStyle: TextStyle(
            fontSize: 14.rt,
            fontWeight: FontWeight.w400,
          )),
    );
  }
}
