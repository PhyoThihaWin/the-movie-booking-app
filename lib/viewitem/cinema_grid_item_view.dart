import 'package:flutter/material.dart';
import 'package:moviebooking/resource/colors.dart';
import 'package:moviebooking/resource/strings.dart';
import 'package:moviebooking/widget/ripple_effect.dart';

import '../resource/dimens.dart';

class CinemaGridItemView extends StatelessWidget {
  final String availability;
  final Function onLongPress;

  CinemaGridItemView(this.availability, this.onLongPress);

  @override
  Widget build(BuildContext context) {
    var bgColor = getContainerBgColor(availability);
    var textColor = getTextColor(availability);

    return InkWell(
      onLongPress: () {
        onLongPress();
      },
      child: Container(
        decoration: BoxDecoration(
            color: bgColor.withOpacity(0.1),
            border: Border.all(color: bgColor),
            borderRadius: BorderRadius.circular(MARGIN_MEDIUM)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "9:30 AM",
              style: TextStyle(
                color: textColor,
                fontSize: TEXT_REGULAR_2X,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: MARGIN_SMALL),
            Text(
              "3D IMAX",
              style: TextStyle(
                color: textColor,
                fontSize: TEXT_REGULAR,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: MARGIN_SMALL),
            Text(
              "Screen 1",
              style: TextStyle(
                color: textColor,
                fontSize: TEXT_REGULAR,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: MARGIN_SMALL),
            Text(
              "2 Available",
              style: TextStyle(
                color: textColor,
                fontSize: TEXT_REGULAR,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }

  Color getContainerBgColor(String available) {
    Color bgColor;
    switch (available) {
      case CINEMA_AVAILABLE:
        bgColor = Colors.green;
        break;
      case CINEMA_FILLING_FAST:
        bgColor = Colors.orange.shade700;
        break;
      case CINEMA_ALMOST_FULL:
        bgColor = Colors.pinkAccent;
        break;
      default:
        bgColor = TEXT_GREY_COLOR;
        break;
    }
    return bgColor;
  }

  Color getTextColor(String available) {
    Color textColor;
    switch (available) {
      case CINEMA_SOLD_OUT:
        textColor = TEXT_GREY_COLOR;
        break;
      default:
        textColor = Colors.white;
        break;
    }
    return textColor;
  }
}
