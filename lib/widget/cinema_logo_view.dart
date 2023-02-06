import 'package:flutter/material.dart';
import 'package:moviebooking/utils/ext.dart';

import '../resource/dimens.dart';

class CinemaLogoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "movie_booking_logo.png".toAssetImage(),
      width: SPLASH_SCREEN_LOGO_WIDTH,
    );
  }
}
