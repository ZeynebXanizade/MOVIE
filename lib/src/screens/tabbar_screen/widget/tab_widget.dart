import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../global/const/colors.dart';

class TabWidget extends StatelessWidget {
  final String text;
  final bool isActive;
  const TabWidget({
    super.key,
    required this.text,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: SvgPicture.asset(
        "assets/svg/$text.svg",
        width: text == "notification" ? 28.rs : 24.rs,
        height: text == "notification" ? 28.rs : 24.rs,
        color: isActive ? ConstantColor.purpleColor : ConstantColor.greyColor,
      ),
    );
  }
}
