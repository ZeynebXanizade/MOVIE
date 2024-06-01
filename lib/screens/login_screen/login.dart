import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';

import 'package:movie_dovie/screens/login_screen/text.dart';

import 'package:movie_dovie/widgets/background_image_widget.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGroundImageWidget(
        child: Padding(
          padding: EdgeInsets.only(top: 101.rh, left: 21.rw, right: 20.rw),
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
              const Texts(
                text: 'Enter  Email',
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
              const Texts(text: 'Enter  password'),
              20.verticalSpace,
              Text(
                'Confirm Password',
                style: TextStyle(
                  color: const Color(0xFFFFFFFF),
                  fontSize: 12.rt,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Texts(
                text: 'Confirm password',
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
                onPressed: null,
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
                child: const Text(
                  'Login to my account',
                  style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
