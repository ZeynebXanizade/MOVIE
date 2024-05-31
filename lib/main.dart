import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';
import 'package:movie_dovie/screens/onboarding_screen/on_boarding.dart';
import 'package:movie_dovie/screens/welcome_screen/welcome_screen.dart';

void main() => runApp(const MovieDovie());

class MovieDovie extends StatelessWidget {
  const MovieDovie({super.key});

  @override
  Widget build(BuildContext context) {
    return const Flexify(
      designHeight: 812,
      designWidth: 375,
      app: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: WelcomeScreen(),
      ),
    );
  }
}
