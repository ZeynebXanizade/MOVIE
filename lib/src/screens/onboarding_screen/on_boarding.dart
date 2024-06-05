import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';
import '../../widgets/background_image_widget.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGroundImageWidget(
        child: Center(
          child: Text(
            'MOVIE-DOVIE',
            style: TextStyle(
                fontSize: 24.rt,
                fontWeight: FontWeight.w700,
                color: const Color(0xFFE5B8F4)),
          ),
        ),
      ),
    );
  }
}
