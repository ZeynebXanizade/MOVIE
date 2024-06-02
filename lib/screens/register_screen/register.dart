import 'package:firebase_auth/firebase_auth.dart';
import 'package:flexify/flexify.dart';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_dovie/screens/login_screen.dart/login_screen.dart';
import 'package:movie_dovie/servises_auth.dart';

import 'package:movie_dovie/widgets/custom_text_field.dart';

import 'package:movie_dovie/widgets/background_image_widget.dart';

class Register extends ConsumerWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _error = 'Oops';
  final _formKey = GlobalKey<FormState>();
  Register({super.key});
  Future<void> register() async {
    try {
      await AuthServise().signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
    } on FirebaseAuthException catch (e) {
      _error = e.message.toString();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: BackGroundImageWidget(
        child: Padding(
          padding: EdgeInsets.only(top: 101.rh, left: 21.rw, right: 20.rw),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Create an account',
                    style: TextStyle(
                      color: const Color(0xFFFFFFFF),
                      fontSize: 24.rt,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  15.verticalSpace,
                  Text(
                    'Welcome friend, enter your details so lets\nget started in ordering a movie',
                    style: TextStyle(
                      color: const Color(0xFFFFFFFF),
                      fontSize: 14.rt,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  50.verticalSpace,
                  Text(
                    'Email adress',
                    style: TextStyle(
                        color: const Color(0xFFFFFFFF),
                        fontSize: 12.rt,
                        fontWeight: FontWeight.w400),
                  ),
                  10.verticalSpace,
                  CustomTextField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Something';
                      }
                      return null;
                    },
                    text: 'Enter  Email',
                    textInputAction: TextInputAction.next,
                  ),
                  20.verticalSpace,
                  Text(
                    'Password',
                    style: TextStyle(
                      color: const Color(0xFFFFFFFF),
                      fontSize: 12.rt,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  10.verticalSpace,
                  CustomTextField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password can't be empty";
                      } else if (value.length < 10) {
                        return "Password must be longer than 10 characters";
                      }
                      return null;
                    },
                    text: 'Enter  password',
                    textInputAction: TextInputAction.next,
                  ),
                  20.verticalSpace,
                  Text(
                    'Confirm Password',
                    style: TextStyle(
                      color: const Color(0xFFFFFFFF),
                      fontSize: 12.rt,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  CustomTextField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password can't be empty";
                      } else if (value.length < 10) {
                        return "Password must be longer than 10 characters";
                      }
                      return null;
                    },
                    text: 'Confirm password',
                    textInputAction: TextInputAction.done,
                  ),
                  84.verticalSpace,
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 66.rw),
                    width: 204.rw,
                    height: 50.rh,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('assets/images/google.png'),
                        Text(
                          'Sign-In with Google',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: const Color(0xFF000000),
                            fontSize: 14.rt,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  20.verticalSpace,
                  ElevatedButton(
                    onPressed: () {
                      null;
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 335.rw,
                      height: 51.rh,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(
                          colors: [Color(0xFF810CA8), Color(0xFFE5B8F4)],
                        ),
                      ),
                      child: Text(
                        'Create an account',
                        style: TextStyle(
                          fontSize: 14.rt,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF2D033B),
                        ),
                      ),
                    ),
                  ),
                  24.verticalSpace,
                  Padding(
                    padding: EdgeInsets.only(left: 90.rw),
                    child: InkWell(
                      onTap: () {
                        Flexify.go(const LoginScreen());
                      },
                      child: const Text(
                        'Login to my account',
                        style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
