import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_dovie/src/global/const/colors.dart';
import 'package:movie_dovie/src/screens/home_screen/widgets/all_movie_widgets.dart';
import 'package:movie_dovie/src/screens/home_screen/widgets/movies_category_widgets.dart';
import 'package:movie_dovie/src/widgets/background_image_widget.dart';
import 'package:movie_dovie/src/widgets/logo_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGroundImageWidget(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 21.rw, vertical: 10.rh),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Center(child: LogoWidget()),
            SizedBox(
              height: 20.rh,
            ),
            Text(
              'Movie of the day!!',
              style: GoogleFonts.dmSans(
                textStyle: const TextStyle(
                    color: ConstantColor.whiteColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 24),
              ),
            ),
            SizedBox(
              height: 20.rh,
            ),
            const AllMoviesWidget(),
            const Expanded(child: MoviesCategoryWidgets()),
          ],
        ),
      )),
    );
  }
}
