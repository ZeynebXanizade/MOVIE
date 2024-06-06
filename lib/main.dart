import 'package:firebase_core/firebase_core.dart';
import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_dovie/src/screens/login_screen.dart/login_screen.dart';
import 'package:movie_dovie/src/screens/tabbar_screen/bottom_navbar_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(child: MovieDovie()));
}

class MovieDovie extends StatelessWidget {
  const MovieDovie({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexify(
      designHeight: 812,
      designWidth: 375,
      app: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
        theme: ThemeData.light().copyWith(
            bottomSheetTheme:
                BottomSheetThemeData(backgroundColor: Colors.transparent)),
        darkTheme: ThemeData.dark(),
      ),
    );
  }
}
