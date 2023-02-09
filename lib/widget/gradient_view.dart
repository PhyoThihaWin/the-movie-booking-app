import 'package:flutter/material.dart';

import '../resource/colors.dart';

class GradientView extends StatelessWidget {
  final double? height;

  GradientView({this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            HOME_SCREEN_BACKGROUND_COLOR,
          ],
        ),
      ),
    );
  }
}
