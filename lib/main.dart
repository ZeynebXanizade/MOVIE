import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_dovie/screens/login_screen.dart/login_screen.dart';
import 'package:movie_dovie/screens/register_screen/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// ...

void main() => runApp(const ProviderScope(child: MovieDovie()));

class MovieDovie extends StatelessWidget {
  const MovieDovie({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexify(
      designHeight: 812,
      designWidth: 375,
      app: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: Register(),
      ),
    );
  }
}
