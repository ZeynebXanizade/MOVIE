import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';

class BackGroundImageWidget extends StatelessWidget {
  final Widget child;
  const BackGroundImageWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 812.rh,
        width: 375.rw,
        decoration: const BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            'assets/images/Sky.png',
          ),
        )),
        child: child);
  }
}
