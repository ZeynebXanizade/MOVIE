import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';
import 'package:movie_dovie/src/screens/home_screen/home_screen.dart';

import '../global/const/colors.dart';

class BackAndSaveButtonWidgets extends StatelessWidget {
  final String imageText;
  const BackAndSaveButtonWidgets({
    super.key,
    required this.imageText,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Flexify.back();
      },
      child: Container(
          width: 40.rw,
          height: 40.rh,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: ConstantColor.purpleColor,
              borderRadius: BorderRadius.circular(15)),
          child: Image.asset(
            "assets/images/$imageText.png",
            color: ConstantColor.whiteColor,
          )),
    );
  }
}
