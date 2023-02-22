import 'package:flutter/material.dart';

import '../resource/colors.dart';
import '../resource/dimens.dart';

class CinemaFacilityItemView extends StatelessWidget {
  final String imagePath;
  final String serviceName;
  final Color fillColor;

  CinemaFacilityItemView(this.serviceName, this.imagePath,
      {this.fillColor = TEXT_GREY_COLOR});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          imagePath,
          color: fillColor,
          height: MARGIN_MEDIUM_3,
          width: MARGIN_MEDIUM_3,
        ),
        SizedBox(width: MARGIN_6),
        Text(
          serviceName,
          style: TextStyle(
              color: fillColor,
              fontSize: TEXT_REGULAR,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(width: MARGIN_MEDIUM_2),
      ],
    );
  }
}
