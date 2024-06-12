import 'package:firebase_core/firebase_core.dart';
import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:movie_dovie/src/presentation/providers/language_change_controller.dart';
import 'package:movie_dovie/src/screens/login_screen.dart/login_screen.dart';
import 'package:movie_dovie/src/screens/on_boarding_screen/onboarding_screen.dart';
import 'package:movie_dovie/src/screens/tabbar_screen/bottom_navbar_screen.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // final prefs = await SharedPreferences.getInstance();
  // final String languageCode = prefs.getString('language_code') ?? "";
  runApp(ProviderScope(
      child: MovieDovie(
          // locale: languageCode,
          )));
}

class MovieDovie extends StatelessWidget {
  // final String locale;
  const MovieDovie({
    super.key,
    // required this.locale,
  });

  @override
  Widget build(BuildContext context) {
    return Flexify(
      designHeight: 812,
      designWidth: 375,
      app: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: OnBoardingScreen(),
        theme: ThemeData.light().copyWith(
            bottomSheetTheme:
                BottomSheetThemeData(backgroundColor: Colors.transparent)),
        darkTheme: ThemeData.dark().copyWith(
            bottomSheetTheme:
                BottomSheetThemeData(backgroundColor: Colors.transparent)),
        navigatorKey: Get.key,
        onGenerateRoute: (settings) {
          return GetPageRoute(
            settings: settings,
            page: () {
              switch (settings.name) {
                case '/login':
                  return LoginScreen();
                case '/onboarding':
                  return OnBoardingScreen();
                case '/bottomNavbar':
                  return BottomNavbarScreen();
                default:
                  return OnBoardingScreen();
              }
            },
          );
        },
      ),
    );
  }
}
