import 'package:firebase_auth/firebase_auth.dart';
import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:movie_dovie/servises_auth.dart';
import 'package:movie_dovie/widgets/custom_text_field.dart';
import 'package:movie_dovie/screens/register_screen/register.dart';
import 'package:movie_dovie/widgets/background_image_widget.dart';

class LoginScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
  LoginScreen({super.key});
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _FormKey = GlobalKey<FormState>();
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  final _formKey = GlobalKey<FormState>();

  late String _error;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _error = 'Oops';

    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> signIn() async {
    try {
      await AuthServise().signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
    } on FirebaseAuthException catch (e) {
      _error = e.message.toString();
    }
  }

  Future<void> sinOut() async {
    try {
      await AuthServise().signOut();
    } on FirebaseAuthException catch (e) {
      _error = e.message.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      body: BackGroundImageWidget(
          child: Padding(
        padding: EdgeInsets.only(left: 21.rw, top: 101.rh, right: 20.rw),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Login to your  account',
                style: TextStyle(
                  color: const Color(0xFFFFFFFF),
                  fontSize: 24.rt,
                  fontWeight: FontWeight.w700,
                ),
              ),
              15.verticalSpace,
              Text(
                'Good to see you again, enter your details\nbelow to continue ordering.',
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
                key: _FormKey,
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Something';
                  }
                  if (!value.contains("@")) {
                    return 'Please write corret mail';
                  }
                  return null;
                },
                text: 'Enter Email',
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
                  controller: _passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password can't be empty";
                    } else if (value.length < 6) {
                      return "Password must be longer than 6 characters";
                    }
                    return null;
                  },
                  text: 'Enter  password',
                  textInputAction: TextInputAction.done),
              160.verticalSpace,
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
                  signIn();
                  debugPrint(_error);
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
                    'Sign in',
                    style: TextStyle(
                      fontSize: 14.rt,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF2D033B),
                    ),
                  ),
                ),
              ),
              16.verticalSpace,
              Padding(
                padding: EdgeInsets.only(left: 90.rw),
                child: InkWell(
                  onTap: () {
                    Flexify.go(Register());
                  },
                  child: const Text(
                    'Go to register',
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
      )),
    );
  }
}
